/**
* Your implementation of the Darts exercise
*/
component {
	
	/**
	* @returns 
	*/
	function score( x, y) {
		abs_x = Abs(x)
		abs_y = Abs(y)
		distance = Sqr(abs_x * abs_x + abs_y * abs_y)
		if (distance <= 1) {
			return 10
		}
		else if (distance <= 5) {
			return 5
		}
		else if (distance <= 10) {
			return 1
		}
		else {
			return 0
		}
	}
	
}