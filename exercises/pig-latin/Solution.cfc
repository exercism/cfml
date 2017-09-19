/**
* Here is an example solution for the PigLatin exercise
*/
component {

	function translate( input ) {
		var response = '';
		
		// Loop over each work
		return input
			.listToArray( ' ' )
			.map( function( word ) {
		
				// Vowel sounds 
				if( word.reFindNoCase( '^(a|e|i|o|u|yt|xr)' ) ) {
					return word & 'ay';
				// Consonate sounds
				} else if( word.reFindNoCase( '^(ch|squ|qu|thr|th|sch)' ) ) {
					return word.reReplaceNoCase( '^(ch|squ|qu|thr|th|sch)(.*)', '\2\1ay' );
				// Everything else
				} else {
					return word.right( -1 ) & word.left( 1 ) & 'ay';
				}
						
			} )
			.toList( ' ' );
		
	}
			
}