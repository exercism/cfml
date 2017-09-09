component {
	
	function run() {
		ensureTestBox();

		// Create TestBox and run the tests
		testData = new testbox.system.TestBox()
			.runRaw( directory = {
				// Find all CFCs...
				mapping = filesystemUtil.makePathRelative( getCWD() ),
				// ... in this directory ...
				recurse = false,
				// ... whose name ends in "test"
				filter = function( path ) {
					return path.right( 8 ) == 'Test.cfc';
				 }
			} )
			.getMemento();
		
		// Print out the results with ANSI formatting for the CLI
		getInstance( 'CLIRenderer@testbox-commands' )
			.render( print, testData, true );
	}

	private function ensureTestBox() {
		var excerciseRoot = filesystemUtil.resolvePath( '../' );
		var testBoxRoot = excerciseRoot & 'testbox';
		
		if( !directoryExists( testBoxRoot ) ) {
			
			print.boldRedLine( 'Installing some missing dependencies for you!' ).toConsole();
			command( 'install' )
				.inWorkingDirectory( excerciseRoot )
				.run();
		}
		
		// Bootstrap TestBox framework
		filesystemUtil.createMapping( '/testbox', testBoxRoot );
	}

}

