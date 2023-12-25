/**
* Here is an example solution for the Etl exercise
*/
component {
	
	/**
	* @returns 
	*/
	function transform( legacy ) {
		var results = {};

		legacy.each( function( score, letters ) {
			for(letter in letters) {
				letter = LCase(letter);
				results[letter] = score;
			}
		});

		return results;
	}
	
}