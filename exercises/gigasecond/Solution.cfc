/**
* Here is an example solution for the Gigasecond exercise
*/
component {

	 function add( birthdate ) {
	 	// Convert to local time
	 	birthdate = dateConvert( 'utc2Local', birthdate );
	 	// Add 1 billion seconds
	 	var newDate = dateAdd( 's', 1000000000, birthdate );
	 	// Convert back to UTC
	 	newDate = dateConvert( 'local2Utc', newDate );
	 	return dateFormat( newDate, 'yyyy-mm-dd' ) & 'T' & timeFormat( newDate, 'HH:mm:ss' ); 
	}
	
}