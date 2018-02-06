/**
* Here is an example solution for the FlattenArray exercise
*/
component {

	function flatten( array ) {
		var accumulator = [];
		
		// Loop over items in array
		array
			.each( function( i ) {
				// Skip nulls
				if( !isNull( i ) ) {
					// Simple values get added
					if( isArray( i ) ) {
						accumulator.append( flatten( i ), true );
					// Nested arrays recurse
					} else {
						accumulator.append( i );
					}
				}
			} );
		return accumulator;
	}
			
}