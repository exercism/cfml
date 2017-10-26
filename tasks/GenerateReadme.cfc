/**
* Generate README.md files for exercises
*/
component  {

	/**
	* Run the task to generate read me files
	*/
	function run(
		slug,
		boolean all=false,
		boolean force=false
	){

		/* Init global variables */
		repoRootPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../' );
		problemSpecsPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../../problem-specifications' );
		trackReadmeInsert= fileRead( repoRootPath & "docs/EXERCISE_README_INSERT.md", "utf-8" );
		overwriteExistingFiles = arguments.force;	

		if( !directoryExists( problemSpecsPath ) ){
			error( 'Cannot find [problem-specifications] repo.  It needs to be git cloned to [#problemSpecsPath#]' );
		}
		
		if( all ) {
			
			// Get an array of all the excercise names
			var exercises = directoryList( expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../exercises' ) )
				.map( function( path ) {
					return path.listLast( '/\' );
				} );
		
		} else {
		
			// Acquire slug
			if( isNull( arguments.slug ) ) {
				arguments.slug = ask( 'Exercise slug as defined by Excercism. Ex: "hello-world": ' );
			}
			var exercises = [ slug ];
			
		}

		exercises.each( function( slug ) {
			
			generateReadme( arguments.slug );
			
		} ); // End exercises.each()
	
	}

	private function generateReadme( required string slug ) {

		var readmeContent = "";
		var readMeFile = repoRootPath & "/exercises/" & arguments.slug & "/README.md";

		if ( !fileExists(readMeFile) || overwriteExistingFiles) {

			var spec = getSpec( arguments.slug );

			readmeContent = "## #spec.name#" & chr( 10 ) & chr( 10 );
			readmeContent = readmeContent & spec.description & chr( 10 );
			readmeContent = readmeContent & getHints( arguments.slug ) & chr( 10 );
			readmeContent = readmeContent & trackReadmeInsert & chr( 10 );
			readmeContent = readmeContent & spec.credits & chr( 10 );
			readmeContent = readmeContent & "#### Submitting Incomplete Solutions#chr( 10 )#It's possible to submit an incomplete solution so you can see how others have completed the exercise.#chr( 10 )#";

			/* Write the file */
			fileWrite( readMeFile , readmeContent, "utf-8" );

			print.greenLine( 'Readme generated!' )
				.indentedYellowLine( readMeFile )
				.toConsole();
		}
		else {
			print.redLine("README.md already exists! Use the overwrite=true to overwrite the file.")
				.indentedYellowLine( readMeFile )
				.toConsole();
		}

	}

	/**
	*
	* Get the optional .meta/hint.md content
	*
	*/
	private function getHints( required string slug ) {

		var hintsFilePath = repoRootPath & "/exercises/" & arguments.slug & "/.meta/hints.md";
		var hints = fileExists( hintsFilePath ) ? fileRead( hintsFilePath, "utf-8" ) : "";

		return hints;
	}

	private function getSpec( required string slug ) {

		var spec = getExerciseMetadata( arguments.slug );

		/* Use title from metadata.yml if provided else we must use the slug */
		if ( len( spec.title )) {
			spec.name = spec.title;
		}
		else {
			spec.name = titleCaseSlug( arguments.slug );
		}

		spec.credits = getCredits( spec );
		spec.description = getDescription( arguments.slug );

		return spec;
	}

	/**
	*
	* Get the exercise description
	*
	*/
	private function getDescription( required string slug ) {

		var descriptionFilePath = problemSpecsPath & "/exercises/" & arguments.slug & "/description.md";
		 
		return fileExists( descriptionFilePath ) ? trim( fileRead( descriptionFilePath, "utf-8" ) ) : "";
	}

	/**
	*
	* Get the content for exercise credits
	*
	*/
	private function getCredits( required struct spec ) {

		if ( spec.source_url == "" ) {
			var credits =  spec.source;
		}
		else if ( spec.source == "") {
			var credits =  "[#spec.source_url#](#spec.source_url#)";
		}
		else {
			var credits = "#spec.source# [#spec.source_url#](#spec.source_url#)";
		}

		if ( len( credits ) ) {
			credits = "#### Source" & chr( 10 ) & chr( 10 ) & credits & chr( 10 );
		}

		return  credits;
	}

	/**
	*
	* Convert exercise slug to a title
	*
	*/
	private function titleCaseSlug( required string slug ) {
		return trim( reReplace( arguments.slug, "(\b|-)([a-zA-Z])", " \u\2", "all" ) );
	}

	/**
	*
	* Get exercise metadata from metadata.yml in the problem-specifications
	*
	*/
	private struct function getExerciseMetadata( required string slug ) {

		var metadataFilePath = problemSpecsPath & "/exercises/" & arguments.slug & "/metadata.yml";
		var content = fileRead( metadataFilePath , "utf-8");
		var metadata = {};

		/* Get the title if provided in metadata.yml */
		metadata.title = parseMetadata( "title", content );

		/* Get the source of the exercise if provided in metadata.yml */
		metadata.source = parseMetadata( "source", content );

		/* Get the source url if provided in metadata.yml */
		metadata.source_url = parseMetadata( "source_url", content );

		return metadata;
	}

	/**
	*
	* Parse metadata from metadata.yml content
	*
	*/
	private string function parseMetadata( required string key, required string content ) {
		var result = "";

		var matches = reFindNoCase( "#arguments.key#: ""(.*?)""", content, 1, true );
		if ( matches.pos.len() == 2 ) {
			result = mid( content, matches.pos[2], matches.len[2]);
		}

		return result;
	}

}