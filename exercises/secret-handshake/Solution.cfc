/**
* Here is an example solution for the SecretHandshake exercise
*/
component {

	function commands( number ) {
		var handshake = [];
		// 1
		if( bitMaskRead( number, 0, 1 ) ) {
			handShake.append( 'wink' );
		}
		// 10
		if( bitMaskRead( number, 1, 1 ) ) {
			handShake.append( 'double blink' );
		}
		// 100
		if( bitMaskRead( number, 2, 1 ) ) {
			handShake.append( 'close your eyes' );
		}
		// 1000
		if( bitMaskRead( number, 3, 1 ) ) {
			handShake.append( 'jump' );
		}
		// 10000
		if( bitMaskRead( number, 4, 1 ) ) {
			handShake = handShake.reverse();
		}
		return handShake;
	}
			
}