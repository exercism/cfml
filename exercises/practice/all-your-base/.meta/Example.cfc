/**
* Here is an example solution for the All Your Base exercise
*/
component {

	function rebase(inputBase, digits, outputBase) {
		if ( inputBase < 2 || outputBase < 2 ) { 
			return -1; 
		}

		var number = 0;
		for ( digit in digits ) {
			if ( digit < 0 || digit >= inputBase ) {
				return -1;
			}
			number = number * inputBase + digit;
		}
		
		var result = [];
		var digit;
		while ( number >= outputBase ) {
			digit = number % outputBase;
			result.append(digit);
			number = (number - digit) / outputBase;
		}
		result.append(number);

		return result.reverse();
	}
	
}