/**
* Here is an example solution for the Hamming exercise
*/
component {

	 function distance( strand1, strand2 ) {
	 	// Validation
		if( strand1.len() != strand2.len() ){
			throw( 'left and right strands must be of equal length' );
		}
		
		var distance = 0;
		var i = 0;
		// Loop over each char
		while( ++i <= strand1.len() ) {
			// If the corresponding chars in each space don't match...
			if( strand1[ i ] != strand2[ i ] ) {
				// Count it as a differnce
				distance++;
			}
		}
		return distance;
	}
	
}