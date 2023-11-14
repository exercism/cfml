/**
* I scaffold a new exercise from the template.
*/
component {
	
	function run(
		slug,
		difficulty,
		uuid=createGUID()
	) {
		var repoRootPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../' );
		
		// Acquire slug
		if( isNull( arguments.slug ) ) {
			arguments.slug = ask( 'Exercise slug as defined by Exercism. Ex: "hello-world": ' );
		}
		
		// Slug of hello-world defaults to name of HelloWorld
		var exerciseName = arguments.slug
			.listToArray( '-' )
			.map( function( i ){
				return i.left( 1 ).uCase() & i.right( -1 ).lCase();
			} )
			.toList( '' );
		
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
			"difficulty": arguments.difficulty+0,
			"slug": arguments.slug,
			"topics": []
		} );		
		fileWrite( repoRootPath & '/config.json', formatterUtil.formatJSON( json=configJSON, indent='  ' , lineEnding=chr( 10 ), spaceAfterColon=true ) );

		// Create exercise scaffold
		directoryCreate( exerciseDirectory );
		directoryCopy( repoRootPath & '/tasks/exercise_template', exerciseDirectory, true );
		
		// Perform Token replacements
		command( 'tokenReplace' )
			.params( '**', '@@name@@', exerciseName )
			.inWorkingDirectory( exerciseDirectory )
			.run();
		
		directoryList( exerciseDirectory, true )
			.each( function( path ){
				if( path.findNoCase( '@@name@@' ) ) {
					fileMove( path, path.replaceNoCase( '@@name@@', exerciseName, 'all' ) );
				}
			} );
		
		print.boldGreenLine( 'New exercise created!' )
			.line()
			.greenLine( 'The exercise is located here: ' )
			.indentedYellowLine( exerciseDirectory )
			.line()
			.greenLine( 'Create a sample solution here: ' )
			.indentedYellowLine( exerciseDirectory & '/Solution.cfc' )
			.line()
			.greenLine( 'Test your solution with this command: ' )
			.indentedYellowLine( 'box task run TestRunner --:solution' )
			.line()
			.toConsole();

		// Generate test suite
		command( 'task run' )
			.params( 'GenerateTests', 'run', slug )
			.inWorkingDirectory( repoRootPath & '/tasks' )
			.run();

		// Generate README.md
		command( 'task run' )
			.params( 'GenerateReadme', 'run', slug )
			.inWorkingDirectory( repoRootPath & '/tasks' )
			.run();
		
	}
	
}
