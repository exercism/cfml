/**
* Here is an example solution for the Leap exercise
*/
component {

	/**
	* @year The input year to consider
	*
	* @returns A boolean for whether the inputted year is true or false
	*/
	function leapYear( year ) {
		if( year % 400 == 0 ) {
			return true;
		} else if( year % 4 == 0 && year % 100 != 0 ) {
			return true;
		}
		return false;
	}
}