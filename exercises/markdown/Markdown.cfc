/**
* Your implmentation of the Markdown exercise
*/
component {
	
	/**
	* @returns
	*/
	function parse(required string markdown) {
		
		var lines = listToArray( arguments.markdown, chr( 10 ) );
		var output = [];

		var isInList = false;

		for (var line in lines) {
			var matches = reMatchNoCase( "^[##]+(.*)", line);
			if ( matches.len() ) {
				var hLevel = reMatchNoCase( "[##]+", matches[1])[1];
				line = "<h#hLevel.len()#>" & trim( replace( matches[1], hLevel, "" ) ) & "</h#hLevel.len()#>";
			}

			matches = reMatchNoCase( "\*(.*)", line);
			if ( matches.len() ) {
				if ( !isInList ) {
					isInList = true;
					var isBold = false;
					var isItalic = false;

					var matches2 = reFindNoCase( "(.*)__(.*)__(.*)", matches[1], 0, true  );
					if ( matches2.len[1] ) {
						var match1 = mid(line, matches2.pos[2], matches2.len[2]);
						var match2 = mid(line, matches2.pos[3], matches2.len[3]);
						var match3 = mid(line, matches2.pos[4], matches2.len[4]);
						matches[1] = match1 & "<strong>" & match2 & "</strong>" & match3;
						isBold = true;
					}

					var matches3 = reFindNoCase( "(.*)_(.*)_(.*)", matches[1], 0, true  );
					if ( matches3.len[1] ) {
						var match1 = mid(line, matches3.pos[2], matches3.len[2]);
						var match2 = mid(line, matches3.pos[3], matches3.len[3]);
						var match3 = mid(line, matches3.pos[4], matches3.len[4]);
						matches[1] = match1 & "<em>" & match2 & "</em>" & match3;
						isItalic = true;
					}

					if ( isItalic || isBold ) {
						line = "<ul><li>" & trim( replace( matches[1], "*", "", "all" ) ) & "</li>";
					} 
					else {
						line = "<ul><li>" & trim( replace( matches[1], "*", "", "all" ) ) & "</li>";
					}

				} 
				else {
					var isBold = false;
					var isItalic = false;

					var matches2 = reFindNoCase( "(.*)__(.*)__(.*)", matches[1], 0, true );
					if ( matches2.len[1] ) {
						var match1 = mid(line, matches2.pos[2], matches2.len[2]);
						var match2 = mid(line, matches2.pos[3], matches2.len[3]);
						var match3 = mid(line, matches2.pos[4], matches2.len[4]);
						matches[1] = match1 & "<strong>" & match2 & "</strong>" & match3;
						isBold = true;
					}

					var matches3 = reFindNoCase( "(.*)_(.*)_(.*)", matches[1], 0, true );
					if ( matches3.len[1] ) {
						var match1 = mid(line, matches3.pos[2], matches3.len[2]);
						var match2 = mid(line, matches3.pos[3], matches3.len[3]);
						var match3 = mid(line, matches3.pos[4], matches3.len[4]);
						matches[1] = match1 & "<em>" & match2 & "</em>" & match3;
						isItalic = true;
					}

					if ( isItalic || isBold ) {
						line = "<li>" & trim( replace( matches[1], "*", "", "all" ) ) & "</li>";
					} 
					else {
						line = "<li>" & trim( replace( matches[1], "*", "", "all" ) ) & "</li>";
					}
				}
			} 
			else {
				if ( isInList ) {
					line = "</ul>" & line;
					isInList = false;
				}
			}

			if ( !reMatchNoCase( "<h|<ul|<p|<li", line ).len() ) {
				line = "<p>#line#</p>";
			}

			var matches = reFindNoCase( "(.*)__(.*)__(.*)", line, 0, true  );
			if ( matches.len[1] ) {
				var match1 = mid(line, matches.pos[2], matches.len[2]);
				var match2 = mid(line, matches.pos[3], matches.len[3]);
				var match3 = mid(line, matches.pos[4], matches.len[4]);
				line = match1 & "<strong>" & match2 & "</strong>" & match3;
			}

			var matches = reFindNoCase( "(.*)_(.*)_(.*)", line, 0, true  );
			if ( matches.len[1] ) {
				var match1 = mid(line, matches.pos[2], matches.len[2]);
				var match2 = mid(line, matches.pos[3], matches.len[3]);
				var match3 = mid(line, matches.pos[4], matches.len[4]);
				line = match1 & "<em>" & match2 & "</em>" & match3;
			}
			output.append( line );
		}
		var html = arrayToList( output, "" );
		if ( isInList ) {
			html &= "</ul>";
		}

		return html;
	}
}