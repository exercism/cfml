/**
* Here is an example solution for the BinarySearch exercise
*/
component {
	
	/**
	* @returns 
	*/
	function find( array, value ) {
		start = 1;
        stop = Len(array);
        while(start <= stop) {
            index = (start + stop) \ 2;
            median = array[index];

            if (median == value) {
                return index;
            } else if (median < value) {
                start = index + 1;
            }  else {
                stop = index - 1;
            }
        }

        throw 'value not in list'
	}
	
}