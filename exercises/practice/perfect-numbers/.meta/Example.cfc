/**
* Here is an example solution for the PerfectNumbers exercise
*/
component {
	
	/**
	* @returns 
	*/
	function classify( number ) {
		if (number < 1 ) {
			throw 'Classification is only possible for positive integers.';
		}
		
		if (number == 1) {
			return 'deficient';
		}

		var aliquotSum = 1
		for (i = 2; i <= sqr(number); i++) {
			if (number % i == 0) {
				var increment = i;
				if (i ^ 2 != number) {
					increment += number / i;					
				}
				aliquotSum += increment;
			}
		}

		if (aliquotSum < number) {
			return 'deficient';
		} elseif (aliquotSum > number) {
			return 'abundant';
		} else {
			return 'perfect';
		}
	}
	
}