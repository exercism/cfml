/**
* Here is an example solution for the PigLatin exercise
*/
component {

	function translate( phrase ) {
		var response = '';
		
		// Loop over each work
		return phrase
			.listToArray( ' ' )
			.map( function( word ) {
		
				// Vowel sounds 
				if( word.reFindNoCase( '^(a|e|i|o|u|yt|xr)' ) ) {
					return word & 'ay';
				// Consonate sounds
				} else if( word.reFindNoCase( '^(ch|squ|qu|thr|th|sch|rh)' ) ) {
					return word.reReplaceNoCase( '^(ch|squ|qu|thr|th|sch|rh)(.*)', '\2\1ay' );
				// Everything else
				} else {
					return word.right( -1 ) & word.left( 1 ) & 'ay';
				}
						
			} )
			.toList( ' ' );
		
	}
			
}