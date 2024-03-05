component extends="testbox.system.BaseSpec" {


	function run(){

		describe( "My CircularBuffer class", function(){

			it( "reading empty buffer should fail", function(){
				SUT = new CircularBuffer( capacity = 1 );
				expect( function(){ SUT.read(); } ).toThrow( message="Empty buffer" );
			});

			it( "can read an item just written", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				expect( SUT.read() ).toBe( 1 );
			});

			it( "each item may only be read once", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				expect( SUT.read() ).toBe( 1 );
				expect( function(){ SUT.read(); } ).toThrow( message="Empty buffer" );
			});

			it( "items are read in the order they are written", function(){
				SUT = new CircularBuffer( capacity = 2 );
				SUT.write( 1 );
				SUT.write( 2 );
				expect( SUT.read() ).toBe( 1 );
				expect( SUT.read() ).toBe( 2 );
			});

			it( "full buffer can't be written to", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				expect( function(){ SUT.write( 2 ); } ).toThrow( message="Full buffer" );
			});

			it( "a read frees up capacity for another write", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				expect( SUT.read() ).toBe( 1 );
				SUT.write( 2 );
				expect( SUT.read() ).toBe( 2 );
			});

			it( "read position is maintained even across multiple writes", function(){
				SUT = new CircularBuffer( capacity = 3 );
				SUT.write( 1 );
				SUT.write( 2 );
				expect( SUT.read() ).toBe( 1 );
				SUT.write( 3 );
				expect( SUT.read() ).toBe( 2 );
				expect( SUT.read() ).toBe( 3 );
			});

			it( "items cleared out of buffer can't be read", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				SUT.clear();
				expect( function(){ SUT.read(); } ).toThrow( message="Empty buffer" );
			});

			it( "clear frees up capacity for another write", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.write( 1 );
				SUT.clear();
				SUT.write( 2 );
				expect( SUT.read() ).toBe( 2 );
			});

			it( "clear does nothing on empty buffer", function(){
				SUT = new CircularBuffer( capacity = 1 );
				SUT.clear();
				SUT.write( 1 );
				expect( SUT.read() ).toBe( 1 );
			});

			it( "overwrite acts like write on non-full buffer", function(){
				SUT = new CircularBuffer( capacity = 2 );
				SUT.write( 1 );
				SUT.overwrite( 2 );
				expect( SUT.read() ).toBe( 1 );
				expect( SUT.read() ).toBe( 2 );
			});

			it( "overwrite replaces the oldest item on full buffer", function(){
				SUT = new CircularBuffer( capacity = 2 );
				SUT.write( 1 );
				SUT.write( 2 );
				SUT.overwrite( 3 );
				expect( SUT.read() ).toBe( 2 );
				expect( SUT.read() ).toBe( 3 );
			});

			it( "overwrite replaces the oldest item remaining in buffer following a read", function(){
				SUT = new CircularBuffer( capacity = 3 );
				SUT.write( 1 );
				SUT.write( 2 );
				SUT.write( 3 );
				expect( SUT.read() ).toBe( 1 );
				SUT.write( 4 );
				SUT.overwrite( 5 );
				expect( SUT.read() ).toBe( 3 );
				expect( SUT.read() ).toBe( 4 );
				expect( SUT.read() ).toBe( 5 );
			});

			it( "initial clear does not affect wrapping around", function(){
				SUT = new CircularBuffer( capacity = 2 );
				SUT.clear();
				SUT.write( 1 );
				SUT.write( 2 );
				SUT.overwrite( 3 );
				SUT.overwrite( 4 );
				expect( SUT.read() ).toBe( 3 );
				expect( SUT.read() ).toBe( 4 );
				expect( function(){ SUT.read(); } ).toThrow( message="Empty buffer" );
			});

		});

	}

}