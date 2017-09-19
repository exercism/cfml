/**
* Here is an example solution for the SaddlePoints exercise
*/
component {

	function saddlePoints( input ) {
		if( input.isEmpty() || input[ 1 ].isEmpty() ) {
			return [];
		}
		
		var result = [];
		// Loop over each column
		for( var col=1; col<=3; col++ ) {
			
			// Loop over each row
			for( var row=1; row<=3; row++ ) {
				
				// This value must be the biggest int he row
				if( getAt( input, row, col ) >= rowMax( input, row )
					// and the least in the column
					&& getAt( input, row, col ) <= colMin( input, col ) ){
					
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
	private function colMin( input, col ) {
		return [ input[ 1 ][ col ], input[ 2 ][ col ], input[ 3 ][ col ] ].min();
	}	
	
	/**
	* Get maximum value for a row
	*/
	private function rowMax( input, row ) {
		return input[ row ].max();
	}	
	
	/**
	* Get a specific value from the matrix
	*/
	private function getAt( input, row, col ) {
		return input[ row ][ col ];
	}
		
}