/**
* I am a CommandBox task runner which you can use to test your implementation of this exercise against the 
* provided test suite.  To use me, open the CommandBox CLI and run this:
* 
* CommandBox> task run TestRunner
*
* To start up a test watcher that will automatically rerun the test suite every time you save a file change, run this:
*
* CommandBox> task run TestRunner --watcher
*
*/
component {
	
	/**
	* @solution Runs the tests against the solution
	* @watcher Start up a file watch that re-runs the tests on file changes. Use Ctrl-C to stop
	*/
	function run( boolean solution=false, boolean watcher=false ) {
		
		ensureTestBox();

		if( watcher ) {
		
			// Tabula rasa
			command( 'cls' ).run();
				
			// Start watcher
			watch()
				.paths( '*.cfc' )
				.inDirectory( getCWD() )
				.withDelay( 500 )
				.onChange( function() {
	
					// Clear the screen
					command( 'cls' )
						.run();

					// This is neccessary so changes to tests get picked up right away.
					pagePoolClear();	
					
					runTests( solution );
	
				} )
				.start();
					
		} else {
			runTests( solution );
		}			

	}

	/**
	* Make sure the TestBox framework is installed
	*/
	private function ensureTestBox() {
		var excerciseRoot = getCWD();
		var testBoxRoot = excerciseRoot & '/testbox';
		
		if( !directoryExists( testBoxRoot ) ) {
			
			print.boldYellowLine( 'Installing some missing dependencies for you!' ).toConsole();
			command( 'install' )
				.inWorkingDirectory( excerciseRoot )
				.run();
		}
		
		// Bootstrap TestBox framework
		filesystemUtil.createMapping( '/testbox', testBoxRoot );
	}

	/**
	* Invoke TestBox to run the test suite
	*/
	private function runTests( boolean solution=false ) {
		
		// Create TestBox and run the tests
		testData = new testbox.system.TestBox()
			.runRaw( directory = {
				// Find all CFCs...
				mapping = filesystemUtil.makePathRelative( getCWD() ),
				// ... in this directory ...
				recurse = false,
				// ... whose name ends in "test"
				filter = function( path ) {
					return path.reFind( ( solution ? 'Solution' : '' ) & 'Test.cfc$' );
				 }
			} )
			.getMemento();
		
		// Print out the results with ANSI formatting for the CLI
		getInstance( 'CLIRenderer@testbox-commands' )
			.render( print, testData, true );
			
		print.toConsole();
		
		// Set proper exit code
		if( testData.totalFail || testData.totalError ) {
			setExitCode( 1 );
		}
	}

}

