/**
* Here is an example solution for the Gigasecond exercise
*/
component {

	 function add( birthdate ) {
		// Add 1 billion seconds
		var newDate = dateAdd( 's', 1000000000, birthdate );
		return dateFormat( newDate, 'yyyy-MM-dd' ) & 'T' & timeFormat( newDate, 'HH:mm:ss' ); 
	}

}
