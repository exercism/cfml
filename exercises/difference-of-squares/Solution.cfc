/**
* Here is an example solution for the DifferenceOfSquares exercise
*/
component {
	
	function squareOfSum( number ) {
		var i = 0
		var accumulator = 0;
		while( ++i <= number ) {
			accumulator += i;
		}
		return accumulator^2;
	}
	
	 function sumOfSquares( number ) {
		var i = 0
		var accumulator = 0;
		while( ++i <= number ) {
			accumulator += i^2;
		}
		return accumulator;
	}
	
	 function differenceOfSquares( number ) {
		return squareOfSum( number ) - sumOfSquares( number );
	}
	
}