/**
* Here is an example solution for the Diamond exercise
*/
component {

	array function rows( input ) {
		
		var numChars = asc( input.uCase() ) - 64;
		var width = ( numChars * 2 ) - 1;
		var overTheHill = false;
		var result = [];
		
		// Loop 
		for( var i=1; i>0; ( overTheHill ? i-- : i++ ) ) {
			
			if( i == 1 ) {
				var sidePadding = repeatString( ' ', ( width - i ) / 2 );
				result.append( sidePadding & chr( 64 + i ) & sidePadding );	
			} else {
				var sidePadding = repeatString( ' ', ( ( width - 1 ) / 2 ) - (i-1) );
				var interiorPadding = repeatString( ' ', ( 2 * ( i - 2 ) ) + 1 );
				result.append( sidePadding & chr( 64 + i ) & interiorPadding  & chr( 64 + i ) & sidePadding );
			}
			
			if( i >= numChars ) {
				overTheHill = true;
			}
		}
		return result;
	}
			
}