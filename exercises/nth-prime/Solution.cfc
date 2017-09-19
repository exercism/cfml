/**
* Here is an example solution for the NthPrime exercise
*/
component {

	function prime( input ) {
		if( input == 0 ) {
			return false;
		}
		var primes = [];
		var candidate = 1;
		while( primes.len() < input ) {
			candidate ++;
			if( candidate % 2 == 0 && candidate != 2 ) {
				continue;
			}
			var factor = 1;
			var isPrime = true;
			while( ++factor < candidate ) {
				if( candidate % factor == 0 ) {
					isPrime = false;
					break;
				}
			}
			if( isPrime ) {
				primes.append( candidate );
			}
		}
		
		return primes.last();
	}

}