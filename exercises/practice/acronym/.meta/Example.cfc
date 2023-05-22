/**
* Here is an example solution for the Acronym exercise
*/
component {

	function abbreviate( phrase ) {
		
		return phrase
			// Break up string on spaces or hyphens
			.listToArray( ' -' )
			// Strip first char of each word
			.map( function( word ) {
				return word.left( 1 );
			} )
			// Concat back to string
			.toList( '' )
			// Upper case for good measure
			.uCase();
			
	}
			
}