/**
* Here is an example solution for the ResistorColorDuo exercise
*/
component {

	COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

	/**
	* @returns 
	*/
	function value( colors ) {
		tens = colorCode(colors[1])
		ones = colorCode(colors[2])
		return tens * 10 + ones
	}

    function colorCode( color ) {
        return ArrayFind(COLORS, color) - 1;
    }

}