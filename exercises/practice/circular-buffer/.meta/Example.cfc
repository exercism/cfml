/**
* Here is an example solution for the CircularBuffer exercise
*/
component {
	
	/**
	* @returns 
	*/
	public any function init( required numeric capacity ) {
		variables.capacity = arguments.capacity;
		clear();

		return this;
	}
	
	public any function read() {
		if (variables.size == 0) {
			throw( message="Circular buffer is empty", type="BufferEmptyException" );
		}
		var value = variables.data[variables.readIndex];
		variables.readIndex = (variables.readIndex % variables.capacity) + 1;
		variables.size -= 1;
		return value;
	}
	
	public void function write( required any value ) {
		if (variables.size >= variables.capacity) {
			throw( message="Circular buffer is full", type="BufferFullException" );
		}

		variables.data[variables.writeIndex] = arguments.value;
		variables.writeIndex = (variables.writeIndex % variables.capacity) + 1;
		variables.size += 1;
	}
	
	public void function overwrite( required any value ) {
		if (variables.size == variables.capacity) {
			read();
		}

		write( arguments.value );
	}
	
	public void function clear() {
		variables.size = 0;
		variables.data = [];
		variables.readIndex = 1;
		variables.writeIndex = 1;
	}

}