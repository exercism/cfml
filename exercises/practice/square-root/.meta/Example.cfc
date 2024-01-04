/**
* Here is an example solution for the SquareRoot exercise
*/
component {

	function squareRoot( radicand ) {
		var result = 0;
        while( result ^ 2 != radicand ) {
            result += 1;
		}

        return result;
	}

}