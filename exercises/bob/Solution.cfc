/**
* Here is an example solution for the Bob exercise
*/
component {
		
	function response( input ) {
		input = input
			.trim()
			.reReplaceNoCase( '[^a-z?]', '' );
		
		if( !input.len() ) {
			return 'Fine. Be that way!';
		}
		
		if( input.reFindNoCase( '[a-z]' ) && compare( input, input.uCase() ) == 0 ) {
			return 'Whoa, chill out!';
		}
		
		if( input.right( 1 ) == '?' ) {
			return 'Sure.';
		}
		
		return 'Whatever.';
		
	}
	
}