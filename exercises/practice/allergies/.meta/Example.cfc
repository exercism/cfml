/**
* Here is an example solution for the Allergies exercise
*/
component {

	variables.allergens = ["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"];

	/**
	* @returns 
	*/
	public function init( required score ) {
		variables.score = arguments.score;
		return this;
    }

	/**
	* @returns 
	*/
	function allergicTo( item ) {
		var itemPresent = function( allergen ) { return variables.item == arguments.allergen; }
		return list().some( itemPresent );
	}
	
	/**
	* @returns 
	*/
	function list() {
		var allergenPresent = function( item, i ) { return booleanFormat( (bitAnd( variables.score, bitShln( 1, ( i - 1 ) ) ) ) ); };
		return variables.allergens.filter( allergenPresent );
	}
	
}