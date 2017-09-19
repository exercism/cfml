/**
* Here is an example solution for the Pangram exercise
*/
component {

	 function isPangram( input ) {
	 	// Lowercase input to simplify search
		input = input.lCase();
		var i = 96;
		// ASCII codes 97-122 are a-z
		while( ++i <= 122 ) {
			// If any letter is missing, then quit
			if( !input.find( chr( i ) ) ) {
				return false;
			}
		}
		// If we made it through, then all letters were found!
		return true;
	}
		
}