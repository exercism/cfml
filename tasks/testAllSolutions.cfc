component {
	
	function run() {
		var exercises = directoryList( expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../exercises' ) );
		
		exercises.each( function( path ) {
			if( fileExists( path & '/TestRunner.cfc' ) ) {
				command( 'task run' )
					.params( 'TestRunner' )
					.flags( 'solution' )
					.inWorkingDirectory( path )
					.run();
			}
		} );
		
	}
	
}