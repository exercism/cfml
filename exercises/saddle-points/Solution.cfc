/**
* Here is an example solution for the SaddlePoints exercise
*/
component {

	function saddlePoints( matrix ) {
		if( matrix.isEmpty() || matrix[ 1 ].isEmpty() ) {
			return [];
		}
		
		var result = [];
		// Loop over each column
		for( var col=1; col<=3; col++ ) {
			
			// Loop over each row
			for( var row=1; row<=3; row++ ) {
				
				// This value must be the biggest int he row
				if( getAt( matrix, row, col ) >= rowMax( matrix, row )
					// and the least in the column
					&& getAt( matrix, row, col ) <= colMin( matrix, col ) ){
					
					// Silly exercise uses inferior 0-based numbering!
					result.append( {
						row : row-1,
						column : col-1
					} );
					
				} // End check
				
			} // end row loop
			
		} // end col loop
		
		return result;
	}
	
	/**
	* Get minimum value for a column
	*/
	private function colMin( matrix, col ) {
		return [ matrix[ 1 ][ col ], matrix[ 2 ][ col ], matrix[ 3 ][ col ] ].min();
	}	
	
	/**
	* Get maximum value for a row
	*/
	private function rowMax( matrix, row ) {
		return matrix[ row ].max();
	}	
	
	/**
	* Get a specific value from the matrix
	*/
	private function getAt( matrix, row, col ) {
		return matrix[ row ][ col ];
	}
		
}