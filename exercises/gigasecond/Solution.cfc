/**
* Here is an example solution for the Gigasecond exercise
*/
component {

	 function add( input ) {
	 	// Convert to local time
	 	input = dateConvert( 'utc2Local', input );
	 	// Add 1 billion seconds
	 	var newDate = dateAdd( 's', 1000000000, input );
	 	// Convert back to UTC
	 	newDate = dateConvert( 'local2Utc', newDate );
	 	return dateFormat( newDate, 'yyyy-mm-dd' ) & 'T' & timeFormat( newDate, 'HH:mm:ss' ); 
	}
	
}