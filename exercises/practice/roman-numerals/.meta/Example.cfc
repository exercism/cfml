/**
* Here is an example solution for the RomanNumerals exercise
*/
component {
	
    var steps: {
        "1000": "M",
        "900":  "CM",
        "500":  "D",
        "400":  "CD",
        "100":  "C",
        "90":   "XC",
        "50":   "L",
        "40":   "XL",
        "10":   "X",
        "9":    "IX",
        "5":    "V",
        "4":    "IV",
        "1":    "I" 
    }
	/**
	* @returns 
	*/
	function roman( number ) {
		var result = ""

        for (step in steps) {
            while(number >= step) {
                number -= step
                result += steps[step]
            }
        }

        return result
	}
	
}