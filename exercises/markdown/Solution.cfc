/**
* Here is an example solution for the Markdown exercise
*/
component {

	/**
	* Parse markdown
	* 
	* @input.hint markdown to parse
	*/
	public string function parse(required string input) {
		
		var lines = listToArray( arguments.input, chr( 10 ) );
		var output = [];
		var isInList = false;

		for (var line in lines) {
			line = parseHeader(line);
			line = parseBold( line );
			line = parseItalic( line );

			line = parseList( line, isInList );
			/* We are in a list if the line contains a list item and not the unordered list closing tag */
			isInList = ( reFindNoCase("<li>", line ) && !reFindNoCase("</ul>", line ) );

			line = parseParagraph( line );
			output.append( line );
		}

		/* Just in case the last line was a list item  */
		if ( isInList ) {
			output.append( "</ul>" );
		}

		var html = arrayToList( output, "" );
		return html;

	}	

	/**
	*
	* Parse  html headers from markdown text
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function parseHeader( required string markdown ) {
		/* Get the header number */
		var headerNumber = reMatchNoCase( "^[##]+", arguments.markdown).len() ?  reMatchNoCase( "^[##]+", arguments.markdown)[1].len() : 0;
		
		if (headerNumber) {
			var pattern = "^[##]+ (.*)";
			var replacement = "<h#headerNumber#>\1</h#headerNumber#>";

			var output = reReplaceNoCase( arguments.markdown, pattern, replacement);
		}
		else {
			var output = arguments.markdown;
		}	
		
		return output;
	}

	/**
	*
	* Parse a list
	*
	* @markdown.hint Markdown text to parse
	* @isInList.hint Flag to indicate if currently parsing a list or not
	*
	*/
	private string function parseList( 
		required string markdown, 
		required boolean isInList 
	) {

		var output = arguments.markdown;

		if ( isListItem( arguments.markdown ) ) {
			if ( !arguments.isInList ) {
				output = "<ul>" & parseListItem( output );
			}
			else {
				output = parseListItem( output );
			}
		}
		else if ( arguments.isInList ) {
			output = "</ul>" & output;
		}
		
		return output;
	}
	

	/**
	*
	* Parse a paragraph
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function parseParagraph( required string markdown ) {

		if ( !reMatchNoCase( "<h|<ul|<p|<li", arguments.markdown ).len() ) {
			var output = "<p>#arguments.markdown#</p>";
		}
		else {
			var output = arguments.markdown;
		}

		return output;
	}

	/**
	*
	* Wrap a list with <ul> tags
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function wrapList( required string markdown ) {
		return "<ul>#arguments.markdown#</ul>";
	}

	/**
	*
	* Check if markdown is a list item
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	public boolean function isListItem( required string markdown ) {
		/* Use regex to determine if markdown is list item */
		return ( reFindNoCase( "\* (.*)",arguments.markdown ) > 0 );
	}
	

	/**
	*
	* Parse a list item
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function parseListItem( required string markdown  ) {

		var pattern = "\* (.*)";
		var replacement = "<li>\1</li>";
		var output = reReplaceNoCase( arguments.markdown, pattern, replacement );

		/* Add a p tag to item if no other tag is present */
		if ( !reFindNoCase("<li><", output ) ) {
			var pattern = "<li>(.*)</li>";
			var replacement = "<li><p>\1</p></li>";
			var output = reReplaceNoCase( output, pattern, replacement );
		}

		return output;
	}
	

	/**
	*
	* Parse bold text from markdown
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function parseBold( required string markdown ) {
		return parseWithDelimiter( arguments.markdown, "__", "strong" );
	}

	/**
	*
	* Parse bold text from markdown
	*
	* @markdown.hint Markdown text to parse
	*
	*/
	private string function parseItalic( required string markdown ) {
		
		return parseWithDelimiter( arguments.markdown, "_", "em" );
	}

	/**
	*
	* Check if string contains <strong> 
	*
	* @content.hint String with content to check
	*
	*/
	private boolean function isBold( required string content ) {

		return ( findNoCase( "<strong>", arguments.content ) > 0 );
	}

	/**
	*
	* Check if string contains <em> 
	*
	* @content.hint String with content to check
	*
	*/
	private boolean function isItalic( required string content ) {

		return ( findNoCase( "<em>", arguments.content ) > 0 );
	}

	/**
	*
	* Utility function to replace markdown delimiter with their tag equivalent
	*
	* @markdown.hint Markdown to parse
	* @delimiter.hint Markdown syntax to replace with tag i.e __
	* @tag.hint HTML tag to replace it with. i.e <strong>
	*
	*/
	public any function parseWithDelimiter( 
		required string markdown, 
		required string delimiter, 
		required string tag 
	) {
		var pattern = "#arguments.delimiter#(.*)#arguments.delimiter#";
		var replacement = "<#arguments.tag#>\1</#arguments.tag#>";

		return reReplaceNoCase( arguments.markdown, pattern, replacement);
	}
}