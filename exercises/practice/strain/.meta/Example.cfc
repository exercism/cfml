/**
* Here is an example solution for the Strain exercise
*/
component {
	
	/**
	* @returns 
	*/
	function keep(list, predicate) {
		var results = [];
		for (elem in list) {
			if (predicate(elem)) {
				arrayAppend(results, elem);
			}
		}

		return results;
	}

	/**
	* @returns 
	*/
	function discard(list, predicate) {
		var newPredicate = function( x ) {return not predicate(x); } 
		return keep(list, newPredicate);
	}
}