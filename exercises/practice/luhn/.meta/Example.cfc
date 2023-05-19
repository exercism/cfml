/**
* Here is an example solution for the Luhn exercise
*/
component {

	function valid( value ) {
		// Remove whitespace
		value = value.reReplace( '\s', '', 'all' );
		
		// Any non numeric chars means invalid
		if( value.reFindNoCase( '[^0-9]' ) ) {
			return false;
		}
		
		// A single 0 is invalid
		if( compare( value, '0' ) == 0 ) {
			return false;
		}
		
		var accumulator = [];
		var oddEven = 0;
		// Loop backwards over the digits
		for( var i=value.len(); i>0; i-- ) {
			var digit = value[ i ];
			// Double every other one
			if( ++oddEven%2 == 0 ) {
				var doubleDigit = digit*2;
				accumulator.prepend( ( doubleDigit > 9 ? doubleDigit-9 : doubleDigit ) );
			} else {
				accumulator.prepend( digit );
			}
		}
		
		// Is the sum of the digits divisible by 10?
		return accumulator.sum() % 10 == 0;
	}
			
}