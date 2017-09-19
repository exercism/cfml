/**
* Here is an example solution for the Raindrops exercise
*/
component {

	function convert( number ) {
		
		var response = '';
		
		// Factor of 3
		if( number % 3 == 0 ) {
			response &= 'Pling';
		}
		
		// Factor of 5
		if( number % 5 == 0 ) {
			response &= 'Plang';
		}
		
		// Factor of 7
		if( number % 7 == 0 ) {
			response &= 'Plong';
		}
		
		// Did we find any factors?
		if( response.len() ) {
			return response;
		} else {
			return number;
		}
	}
			
}