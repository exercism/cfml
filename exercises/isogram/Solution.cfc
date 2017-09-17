/**
* Here is an example solution for the Isogram exercise
*/
component {

	function isIsogram( input ) {
		// Only look at alphabit chars
		var cleanedInput = input.reReplaceNoCase( '[^a-z]', '', 'all' );
		var chars = {};
		
		// Loop over characters
		cleanedInput
			.listToArray( '' )
			.each( function( char ) {
				// And mark distinct list of them
				chars[ char ] = true;
			} );
		
		// If the number of chars in the input is the same as the distinct list
		return cleanedInput.len() == chars.count();
	}
			
}