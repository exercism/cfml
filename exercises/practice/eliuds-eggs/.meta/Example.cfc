/**
* Here is an example solution for the EliudsEggs exercise
*/
component {

	/**
	* @returns 
	*/
	function eggCount( number ) {
		return doEggCount(number, 0)
	}

	function doEggCount( value, eggs ) {
		if (value == 0) {
			return eggs
		}

		if (value % 2 != 0) {
			return doEggCount( value \ 2, eggs + 1)
		}

		return doEggCount( value \ 2, eggs)
	}
}