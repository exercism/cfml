/**
* Here is an example solution for the CollatzConjecture exercise
*/
component {
	
	/**
	* @returns 
	*/
	function steps( number ) {
		if (arguments.number <= 0) {
            throw new Error("Only positive integers are allowed")
        }

        var step = 0
        var working = arguments.number;
        while (working > 1) {
            if (working % 2 == 0) {
                working /= 2
            }
            else {
                working = 3 * working + 1
            }

            step += 1
        }

        return step
	}
	
}