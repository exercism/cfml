/**
* Here is an example solution for the NthPrime exercise
*/
component {

	function prime( number ) {
		if( number == 0 ) {
			throw( 'there is no zeroth prime' );
		}
		if( number == 1 ) {
			return 2;
		}

		var primes = [2];
		var candidate = 1;
		while( primes.len() < number ) {
			candidate += 2;
			var isPrime = true;
			var limit = Round(Sqr(candidate));
			for (var factor in primes) {
				if( factor > limit ) {
					break;
				}

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