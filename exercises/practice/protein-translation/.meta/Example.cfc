/**
* Here is an example solution for the ProteinTranslation exercise
*/
component {

	codonMappings = {
		"AUG": "Methionine",
		"UUU": "Phenylalanine",
		"UUC": "Phenylalanine",
		"UUA": "Leucine",
		"UUG": "Leucine",
		"UCU": "Serine",
		"UCC": "Serine",
		"UCA": "Serine",
		"UCG": "Serine",
		"UAU": "Tyrosine",
		"UAC": "Tyrosine",
		"UGU": "Cysteine",
		"UGC": "Cysteine",
		"UGG": "Tryptophan",
		"UAA": "STOP",
		"UAG": "STOP",
		"UGA": "STOP"	
	}

	/**
	* @returns 
	*/
	function proteins( strand ) {
		return translate(strand, [])
	}

	function translate( strand, acc ) {
		if (Len(strand) == 0) {
			return acc
		}

		if (Len(strand) < 3) {
			Throw(message='Invalid codon')
		}


		codon = Left(strand, 3)
		try {
		    protein = codonMappings.find(codon)
        }
        catch (any e) {
            Throw(message='Invalid codon')
        }
        
		if (protein == 'STOP') {
			return acc
		}

		ArrayAppend(acc, protein)
		return translate(Mid(strand, 4, Len(strand) - 3), acc)
	}

}