/**
* Here is an example solution for the Allergies exercise
*/
component {

	variables.allergens = [
		"eggs", "peanuts", "shellfish", "strawberries",
		"tomatoes", "chocolate", "pollen", "cats"
	];

	variables.myAllergies = [];

	/**
	* @returns
	*/
	public function init( score ) {
		variables.myAllergies = [];
		var bitValue = 1;

		for (var item in variables.allergens) {
			if (bitAnd(score, bitValue) != 0) {
				arrayAppend(variables.myAllergies, item);
			}
			bitValue *= 2;
		}

		return this;
	}

	/**
	* @returns
	*/
	function allergicTo( item ) {
		return arrayContains(variables.myAllergies, item);
	}

	/**
	* @returns
	*/
	function list() {
		return variables.myAllergies;
	}

}
