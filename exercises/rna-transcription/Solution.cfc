/**
* Here is an example solution for the RnaTranscription exercise
*/
component {
	
	 function toRNA( DNA ) {
		var RNA = '';
		
		// Loop over each input character
		for( var i in DNA.listToArray( '' ) ) {
			
			// Swap with RNA value
			switch( i ) {
				case "G":
					RNA &= 'C';
					break;
				case "C":
					RNA &= 'G';
					break;
				case "T":
					RNA &= 'A';
					break;
				case "A":
					RNA &= 'U';
					break;
				// Any unexpected char aborts method and returns null
				default: 
					return;
			}
			
		}
		return RNA;
	}
	
}