/**
* Here is an example solution for the Grains exercise
*/
component {
	
	function square( input ) {
		if( input <= 0 || input > 64 ) {
			return -1
		}
		return 2 ^ ( input-1 );
	}
	
	function total( input ) {
		var total = 0;
		loop from=1 to=64 index='local.i' {
			total += square( i );
		}
		
		return total;
	}
	
}