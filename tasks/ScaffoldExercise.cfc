/**
* I sccold a new exercise from the template.
*/
component {
	
	function run(
		slug,
		name,
		difficulty,
		uuid=createGUID()
	) {
		var repoRootPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../' );
		
		// Acquire slug
		if( isNull( arguments.slug ) ) {
			arguments.slug = ask( 'Exercise slug as defined by Excercism. Ex: "hello-world": ' );
		}
		
		// Acquire name
		if( isNull( arguments.name ) ) {
			// Slug of hello-world defaults to name of HelloWorld
			var defaultName = arguments.slug
				.listToArray( '-' )
				.map( function( i ){
					return i.left( 1 ).uCase() & i.right( -1 ).lCase();
				} )
				.toList( '' );
			arguments.name = ask( message='Exercise Name, camel cased and one word. Ex: "HelloWorld": ', defaultResponse=defaultName );
		}
		
		// Acquire diffculty
		if( isNull( arguments.difficulty ) ) {
			arguments.difficulty = ask( message='Difficulty: ', defaultResponse=1 );
		}

		// Validation to prevent duplicate runs
		var exerciseDirectory = repoRootPath & 'exercises/' & arguments.slug;
		if( directoryExists( exerciseDirectory ) ) {
			error( 'An exercise named [#arguments.slug#] already exists!' );
		}

		// Add this exercise to config.json
		var configJSON = deserializeJSON( fileRead( repoRootPath & '/config.json' ) );
		configJSON.exercises.append( {
			"uuid": arguments.uuid,
			"difficulty": arguments.difficulty,
			"slug": arguments.slug,
			"topics": []
		} );		
		fileWrite( repoRootPath & '/config.json', formatterUtil.formatJSON( configJSON ) );

		// Create exercise scaffold
		directoryCreate( exerciseDirectory );
		directoryCopy( repoRootPath & '/tasks/exercise_template', exerciseDirectory, true );
		
		// Perform Token replacements
		command( 'tokenReplace' )
			.params( '**', '@@name@@', arguments.name )
			.inWorkingDirectory( exerciseDirectory )
			.run();
		
		var exerciseName = arguments.name;
		directoryList( exerciseDirectory, true )
			.each( function( path ){
				if( path.findNoCase( '@@name@@' ) ) {
					fileMove( path, path.replaceNoCase( '@@name@@', exerciseName, 'all' ) );
				}
			} );
		
		print.boldGreenLine( 'New exercise created!' )
			.line()
			.greenLine( 'The exercise is located here: ' )
			.greenIndentedLine( exerciseDirectory )
			.line()
			.line( 'The next steps are to create the unit tests here: ' )
			.indentedLine( exerciseDirectory & '/' & exerciseName & 'Test.cfc' )
			.line()
			.line( 'Then create a sample solution here: ' )
			.indentedLine( exerciseDirectory & '/Solution.cfc' )
			.line()
			.line( 'Test your solution with this command: ' )
			.indentedYellowLine( 'box task run TestRunner --solution' );
		
	}
	
}