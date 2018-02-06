/**
* I test all the solutions in each exercise to make sure they all pass.  
*/
component {
	
	function run() {
		// Get an array of all the excercise names
		var exercises = directoryList( expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../exercises' ) );
		var exitCode = 0;
		
		// If there's a testrunner task in them, run it.  If any of the tasks fail, the exit code will come back as 1
		exercises.each( function( path ) {
			if( fileExists( path & '/TestRunner.cfc' ) ) {
				command( 'task run' )
					.params( 'TestRunner' )
					// Specifically as the task runners to run the SolutionTest
					.flags( ':solution' )
					.inWorkingDirectory( path )
					.run();
				exitCode = max( exitCode, createObject( 'java', 'java.lang.System' ).getProperty( 'cfml.cli.exitCode' ) ?: 0 ); 
			}
		} );
		
		setExitCode( exitCode );		
	}
	
}