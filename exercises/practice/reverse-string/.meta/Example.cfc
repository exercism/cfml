/**
* Here is an example solution for the ReverseString exercise
*/
component {
	
	/**
	* @returns 
	*/
	function reverse( value ) {
		var reversed = '';

		for (i = Len(value); i >= 1; i--) {
			reversed &= value[i];
		}

		return reversed;
	}
	
}