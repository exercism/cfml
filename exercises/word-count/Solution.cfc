/**
* Here is an example solution for the WordCount exercise
*/
component {
		
	function countwords( sentence ) {
		return sentence
			// Strip out chars we don't care about
			.reReplaceNoCase( '[^a-z0-9'' ]', '', 'all' )
			// Break string into array
			.listToArray( ' ' )
			// Reduce arary into struct of word counts
			.reduce( function( wordStats, word ){
				// Clean quoted words
				word = word.reReplaceNocase( "^'(.*)'$", "\1" );
				// Aggregate word counts
				wordStats[ word ] = ( wordStats[ word ] ?: 0 ) + 1;
				return wordStats;
			}, {} );
	}
	
}