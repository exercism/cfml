/**
* Here is an example solution for the AtbashCipher exercise
*/
component {
	
	function encode( phrase ) {
		var result = '';
		var breakCounter = 0;
		
		phrase
			.lcase()
			// Clean anything not alphanumeric
			.reReplace( '[^0-9a-z]', '', 'all' )
			.listToArray( '' )
			// Loop over each char
			.each( function( char ) {
				breakCounter++;
				result &= invertChar( char );				
				// Every 5th char gets a space
				if( breakCounter % 5 == 0 ) {
					result &= ' ';
				}
			} );
			
		// Nuke trailing spaces
		return result.trim();
	}
	
	function decode( phrase ) {
		var result = '';
		
		phrase
			.lcase()
			// Clean anything not alphanumeric
			.reReplace( '[^0-9a-z]', '', 'all' )
			.listToArray( '' )
			// Loop over each char
			.each( function( char ) {
				result &= invertChar( char );
			} );
			
		return result;
	}
	
	private function invertChar( char ) {		
		// Pass numbers straight through
		if( asc( char ) >= 49 && asc( char ) <= 57 ) {
			return char;
		} else {
			// For letters, find the offset from "a" and reverse it from "z"
			// Using the ascii codes as a handy reference intead of creating an array of chars
			return chr( 122 - ( asc( char ) - 97 )  );
		}
	}
	
}