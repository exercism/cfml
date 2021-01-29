/**
* Here is an example solution for the LargestSeriesProduct exercise
*/
component {

	function largestProduct( digits, span ) {
		// Empty span is 1
		if( span == 0 ) {
			return 1;
		}
		// reject negative span
		if( span < 0 ) {
			return -1;
		}
		// reject span longer than digits
		if( span > digits.len() ) {
			return -1;
		}
		// Regect non-numeric characters in digits
		if( digits.reFind( '[^0-9]' ) ) {
			return -1;
		}
		
		var offset = 0;
		var largestProduct = 0;
		// Loop through digits
		while( ++offset <= digits.len()-span+1 ) {
			// Take the larger of the previous largest product...
			largestProduct = max( largestProduct,
				// or the product of the current spanned digits
				digits.mid( offset, span )
					.listToArray( '' )
					.reduce( function( prev, digit ){
						return prev * val( digit );
					}, 1 ) ); 
		}
		
		return largestProduct;
	}
	
}