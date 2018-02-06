/**
* Here is an example solution for the Diamond exercise
*/
component {

	array function rows( letter ) {
		// Offset from ASCII code for "A"
		var numChars = asc( letter.uCase() ) - 64;
		var width = ( numChars * 2 ) - 1;
		var overTheHill = false;
		var result = [];
		
		// Loop from 1 up to last char and back again
		for( var i=1; i>0; ( overTheHill ? i-- : i++ ) ) {
			
			// First and last rows
			if( i == 1 ) {
				var sidePadding = repeatString( ' ', ( width - i ) / 2 );
				result.append( sidePadding & chr( 64 + i ) & sidePadding );
			// All other rows
			} else {
				var sidePadding = repeatString( ' ', ( ( width - 1 ) / 2 ) - (i-1) );
				var interiorPadding = repeatString( ' ', ( 2 * ( i - 2 ) ) + 1 );
				result.append( sidePadding & chr( 64 + i ) & interiorPadding  & chr( 64 + i ) & sidePadding );
			}
			
			// Toggle the loop in reverse
			if( i >= numChars ) {
				overTheHill = true;
			}
		}
		return result;
	}
			
}