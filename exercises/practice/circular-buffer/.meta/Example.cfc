/**
* Here is an example solution for the CircularBuffer exercise
*/
component {
	
	/**
	* @returns 
	*/
	CircularBuffer function init( required numeric capacity ) {
		variables.capacity = arguments.capacity;
		clear();

		return this;
	}
	
	numeric function read() {
		if (variables.size == 0) {
			throw( message="Empty buffer" );
		}
		var value = variables.data[variables.readIndex]
		variables.readIndex = ( variables.readIndex + 1)  % variables.capacity
		variables.size -= 1;
		return value;
	}
	
	void function write( required numeric value ) {
		if (variables.size >= variables.capacity) {
			throw( message="Full buffer" );
		}

		variables.data.set( variables.writeIndex, 1, arguments.value);
		variables.writeIndex = ( variables.writeIndex + 1 ) % variables.capacity;
		variables.size += 1;
	}
	
	void function overwrite( required numeric value ) {
		if (variables.size == variables.capacity) {
			read();
		}

		write( arguments.value );
	}
	
	void function clear() {
		variables.size = 0;
		variables.data = arraySet( [], 1, variables.capacity, nullValue() );
		variables.readIndex = 1;
		variables.writeIndex = 1;
	}

}