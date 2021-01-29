/**
* Here is an example solution for the Anagram exercise
*/
component {
	
	function anagrams( string subject, array candidates ) {
		
		var results = [];

		for (var candidate in candidates) {
			/* Check if the canidate is an anagram and is not already in the results */
			if ( isAnagram( subject, candidate )  && !results.find( lcase( candidate ) ) ) {
				results.append( lcase(candidate) );
			}
		}

		return results;
	}

	/**
	*
	* Is an anagram and canidate is not the exact same as the subject
	*
	*/
	private boolean function isAnagram( string subject, string candidate ) {
		
		return ( sortString( candidate ) == sortString( subject ) && lcase( candidate ) != lcase( subject ) );
	}
	

	/**
	*
	* Sort the characters in a string alphabetically
	*
	*/
	private string function sortString( string word ) {
		
		return listSort( lcase( arguments.word ), "text", "asc", "" );
	}
	
	
}