/**
* Here is an example solution for the ListOps exercise
*/
component {

	/**
	* @returns
	*/
	function append( list1, list2 ) {
		return list1.merge(list2);
	}

	/**
	* @returns
	*/
	function concat( lists ) {
		return foldl(lists, append, []);
	}

	/**
	* @returns
	*/
	function filter( list, fn ) {
		var results = [];
		for (var item in list) {
			if (fn(item)) {
				results.append(item);
			}
		}
		return results;
	}

	/**
	* @returns
	*/
	function length( list ) {
		var fn = function( acc, el ) { return acc + 1; };
		return foldl(list, fn, 0)
	}

	/**
	* @returns
	*/
	function map( list, fn ) {
		var results = [];
		for (var item in list) {
			results.append(fn(item));
		}
		return results;
	}

	/**
	* @returns
	*/
	function foldl( list, fn, initial ) {
		var results = initial;
		for (var item in list) {
			results = fn(results, item);
		}
		return results;
	}

	/**
	* @returns
	*/
	function foldr( list, fn, initial ) {
		if (list.len() == 0) {
			return initial;
		} else {
			var last = list.pop();
			return foldr(list, fn, fn(initial, last));
		}
	}

	/**
	* @returns
	*/
	function reverse( list ) {
		var results = [];
		for (var i = list.len(); i >= 1; i--) {
			results.append(list[i]);
		}
		return results;
	}
}