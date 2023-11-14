/**
* Here is an example solution for the NucleotideCount exercise
*/
component {

	/**
	* @returns 
	*/
	function nucleotideCounts( strand ) {
		a = 0
		c = 0
		g = 0
		t = 0
		cfloop(index="i" from="1" to="#len(strand)#") {
			char = strand[i]
			if (char == "a") {
				a += 1
			} else if (char == "c") {
				c += 1
			} else if (char == "g") {
				g += 1
			} else if (char == "t") {
				t += 1
			} else {
				Throw(message='Invalid nucleotide in strand')
			}
		}

		return  {"A":a,"C":c,"G":g,"T":t}
	}

}