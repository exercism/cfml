/**
* Here is an example solution for the Run Length Encoding exercise
*/
component {
	
	/**
	* @param input : unencoded string
	*
	* @returns RLE-encoded string
	*/
	function encode(input) {
		if (isEmpty(input)) {
			return '';
		}

		chars = input.listToArray('');
		count = 1;
		previousChar = '';
		output = '';

		for (char in chars) {
			if (char == previousChar) {
				count++;
			} else {
				num = (count > 1) ? toString(count) : '';
				output = output & num & previousChar;
				previousChar = char;
				count = 1;
			}
		}
		num = (count > 1) ? toString(count) : '';
		output = output & num & previousChar;
		return output;
	}
	
	/**
	* @param input : RLE-encoded string
	*
	* @returns unencoded string
	*/
	function decode(input) {
		number = '';
		output = '';
		chars = input.listToArray('');

		for (char in chars) {
			if (isNumeric(char)) {
				number &= char;
			} else {
				repeats = (len(number) > 0) ? val(number) : 1;
				output &= repeatString(char, repeats);
				number = '';
			}
		}
		return output;
	}
	
		
}