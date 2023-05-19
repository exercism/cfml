/**
* Here is an example solution for the SumOfMultiples exercise
*/
component {

	function sum( array factors, limit ) {
		var i = 0;
		var accumulator = {};
		// Loop to our limit
		while( ++i < limit ) {
			// For each of the factors
			if( factors.reduce( function( isFactor, factor ){
				// If at least one of our factors divides into this number
				return isFactor || i % factor == 0;
			}, false ) ) {
				// Add it to our distinct list
				accumulator[ i ] = true;
			}
		}
		
		// Total the key names
		return accumulator
			.keyArray()
			.sum();
	}
		
}