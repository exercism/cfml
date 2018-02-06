/**
* Here is an example solution for the Bob exercise
*/
component {
		
	function response( heyBob ) {
		heyBob = heyBob
			.trim()
			.reReplaceNoCase( '[^a-z?]', '' );
		
		if( !heyBob.len() ) {
			return 'Fine. Be that way!';
		}
		
		if( isScreaming( heyBob ) && isQuestion( heyBob ) ) {
			return 'Calm down, I know what I''m doing!';
		}
		
		if( isScreaming( heyBob ) ) {
			return 'Whoa, chill out!';
		}
		
		if( isQuestion( heyBob ) ) {
			return 'Sure.';
		}
		
		return 'Whatever.';
		
	}
	
	private function isScreaming( heyBob ) {
		return heyBob.reFindNoCase( '[a-z]' ) && compare( heyBob, heyBob.uCase() ) == 0;
	}
	
	private function isQuestion( heyBob ) {
		return heyBob.right( 1 ) == '?';
	}
	
}