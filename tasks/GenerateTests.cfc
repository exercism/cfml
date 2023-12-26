/**
* I scaffold a new exercise from the template.
*/
component {
	
	function run(
		slug,
		boolean all=false
	) {
		var repoRootPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../' );
		var problemSpecsPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../../problem-specifications' );
				
		if( !directoryExists( problemSpecsPath ) ){
			error( 'Cannot find [problem-specifications] repo.  It needs to be git cloned to [#problemSpecsPath#]' );
		}
		
		if( all ) {
			
			// Get an array of all the exercise names
			var exercises = directoryList( expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../exercises' ) )
				.map( function( path ) {
					return path.listLast( '/\' );
				} );
		
		} else {
		
			// Acquire slug
			if( isNull( arguments.slug ) ) {
				arguments.slug = ask( 'Exercise slug as defined by Exercism. Ex: "hello-world": ' );
			}
			var exercises = [ slug ];
			
		}
				
		exercises.each( function( slug ) {
			print.line( 'Starting [#slug#]' ).toConsole();
			try {
				
				// Slug of hello-world defaults to name of HelloWorld
				var exerciseName = arguments.slug
					.listToArray( '-' )
					.map( function( i ){
						return i.left( 1 ).uCase() & i.right( -1 ).lCase();
					} )
					.toList( '' );
				
				var exercisePath = problemSpecsPath & '/exercises/' & slug;
				if( !directoryExists( exercisePath ) ){
					error( 'Cannot find exercise [#slug#] in problem-specifications repo.  Tests not generated.' );
				}
				
				var canonicalDataPath = exercisePath & '/canonical-data.json';
				if( !fileExists( canonicalDataPath ) ){
					error( 'Cannot find [canonical-data.json] for this slug.  No tests will be generated' );
				}
		
				var canonicalData = deserializeJSON( fileRead( canonicalDataPath ) );
				var testCases = generateCases( canonicalData.cases );
				
				var testStub = fileRead( repoRootPath & '/tasks/exercise_template/@@name@@Test.cfc' );
				testStub = testStub.replace( '@@name@@', exerciseName, 'all' );
				testStub = testStub.replace( '@@testCases@@', testCases, 'all' );
				var targetExercisePath = repoRootPath & 'exercises/practice/' & slug;
				var newTestPath = targetExercisePath & '/' & exerciseName & 'Test.cfc';
				
				if( !directoryExists( targetExercisePath ) ) {
					error( 'Target exercise does not exist! [#targetExercisePath#]' );
				}
				
				fileWrite( newTestPath, testStub );
				
				print.greenLine( 'Test generated!' )
					.indentedYellowLine( newTestPath )
					.toConsole();
			} catch( 'commandException' var e ) {
				print.boldRedLine( e.message )
					.line();
			}
			
		} ); // End exercises.each()
	}
	
	private function generateCases( cases, level=1 ) {
		var CRLF = chr( 13 ) & chr( 10 );
		var testCases = ''
			
		cases.each( function( case ) {
				
			// Nested spec
			if( case.keyExists( 'cases' ) ) {
				
					testCases &=  "#CRLF##repeatString( chr( 9 ), level )#		describe( #generateDescription( case.description )#, function(){
#generateCases( case.cases, level+1 )#
#repeatString( chr( 9 ), level )#		});#CRLF#";
					
			} else {
				case.expected = case.expected ?: '__NULL__';
				// Don't adjust whitespace
				testCases &=  "#CRLF##repeatString( chr( 9 ), level )#		it( #generateDescription( case.description )#, function(){#CRLF#";
				// Special check for when error should be tested
				if( isStruct( case.expected ) && case.expected.keyExists( 'error' ) ) {
					testCases &=  "#repeatString( chr( 9 ), level )#			expect( function(){ SUT.#case.property#(#generateInput( case )#); } ).#generateExpectation( case.expected )#;#CRLF#";	
				// "normal" expectation
				} else {
					testCases &=  "#repeatString( chr( 9 ), level )#			expect( SUT.#case.property#(#generateInput( case )#) ).#generateExpectation( case.expected )#;#CRLF#";
				}
				testCases &=  "#repeatString( chr( 9 ), level )#		});#CRLF#";
			} 
			
		} );
		
		return testCases;
	}
	
	private function generateDescription( description ) {
		return escapeString( description );
	}
	
	private function generateInput( case ) {
		var thisInput = '';
		if( case.keyExists( 'input' ) ) {
			if( isStruct( case.input ) ) {
				for( var key in case.input ) {
					thisInput = thisInput.listAppend( "#key#=#escapeString( case.input[ key ] )#" );
				}
			} else {
				thisInput = thisInput.listAppend( "input=#escapeString( case.input )#" );				
			}
		}
		if( thisInput.len() ) {
			return ' ' & thisInput.listChangeDelims( ', ', ',' ) & ' ';				
		} else {
			return thisInput;				
		}
	}
	
	private function generateExpectation( expected ) {
		if( isSimpleValue( expected ) && compareNoCase( expected, 'true' ) == 0 ) {
			return 'toBeTrue()';
		} else if( isSimpleValue( expected ) && compareNoCase( expected, 'false' ) == 0 ) {
			return 'toBeFalse()';
		} else if( isSimpleValue( expected) && expected == '__NULL__' ) {
			return 'toBeNull()';
		} else if( isStruct( expected ) && expected.keyExists( 'error' ) ) {
			return 'toThrow( message=#escapeString( expected.error )# )';
		} else {
			return "toBe( #escapeString( expected )# )";
		}
		
	}
	
	private function escapeString( myString ) {
		if( isSimpleValue( myString ) ) {
			myString = replace( myString, "'", "''", "all" );
			myString = replace( myString, '##', '####', 'all' );
			myString = replace( myString, chr( 13 ), '##chr( 13 )##', 'all' );
			myString = replace( myString, chr( 10 ), '##chr( 10 )##', 'all' );
			return "'" & myString & "'";
		} else {
			return convertJSONEscapesToCFML( serializeJSON( myString ) );			
		}
	}
	
	
	// A complex value serialized as JSON differs from CFML struct literals in that
	// double quotes are \" instead of "".  Any escaped double quotes must be converted
	// to the CFML version to work as an object literal.
	private function convertJSONEscapesToCFML( required string arg ) {
		arguments.arg = replaceNoCase( arguments.arg, '\\', '__double_backslash_', 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\/', '/', 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\"', '""', 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '##', '####', 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\t', '	', 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\n', chr(13)&chr(10), 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\r', chr(13), 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\f', chr(12), 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '\b', chr(8), 'all' );
		
		// A null keyword must be preceede dby a , [ : or start of string.  
		// TODO: This doesn't account for the word "null" inside a quoted string.  I'd need to actually parse the string to detect that.
		arguments.arg = reReplaceNoCase( arguments.arg, '(,\s*)null', '\1nullValue()', 'all' );
		arguments.arg = reReplaceNoCase( arguments.arg, '(\[\s*)null', '\1nullValue()', 'all' );
		arguments.arg = reReplaceNoCase( arguments.arg, '(:\s*)null', '\1nullValue()', 'all' );
		arguments.arg = reReplaceNoCase( arguments.arg, '^null', 'nullValue()', 'all' );
		
		// This doesn't work-- I'd need to do it in a loop and replace each one individually.  Meh...
		// arguments.arg = reReplaceNoCase( arguments.arg, '\\u([0-9a-f]{4})', chr( inputBaseN( '\1', 16 ) ), 'all' );
		arguments.arg = replaceNoCase( arguments.arg, '__double_backslash_', '\', 'all' );
		return arguments.arg;
	}
	
}