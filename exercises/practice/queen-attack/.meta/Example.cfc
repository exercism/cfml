/**
* Here is an example solution for the Queen Attack exercise
*/
component {
	
	/**
	* @param row : an integer 0-7
	* @param col : an integer 0-7
	*
	* @returns an object that can be resolved into `row` and `col`, or `false` on error
	*/
	function create(row, col) {
		if (row < 0) {
			// "row not positive"
			return false;
		};
		if (row > 7) {
			// "row not on board"
			return false;
		};
		if (col < 0) {
			// "column not positive"
			return false;
		};
		if (col > 7) {
			 // "column not on board"
			return false;
		};

		return { row: row, col: col };	  
	}

	/**
	* @returns a boolean
	*/
	function canAttack(queen1, queen2) {
		sameRow = (queen1.row == queen2.row);
		sameCol = (queen1.col == queen2.col);
		sameDiagonal = abs(queen1.row - queen2.row) == abs(queen1.col - queen2.col);
		return (sameRow || sameCol || sameDiagonal);
	}
			
}