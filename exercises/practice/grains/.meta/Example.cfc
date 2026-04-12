/**
* Here is an example solution for the Grains exercise
*/
component {
	
	function square( input ) {
		if( input <= 0 || input > 64 ) {
			return -1
		}
		// Some of the test generate very large numbers which require a big integer or they lose precision
		var base = createObject("java","java.math.BigInteger").init( 2 );
		var power = createObject("java","java.math.BigInteger").init( input-1 );
		return base.pow( power ).toString();
	}
	
	function total( input ) {
		var base = createObject("java","java.math.BigInteger").init( 2 );
		var power = createObject("java","java.math.BigInteger").init( 64 );
		var one = createObject("java","java.math.BigInteger").init( 1 );
		return base.pow( power ).subtract( one ).toString();
	}
	
}
