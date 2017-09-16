component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Grains' );
	}

	function run(){
	
		describe( "My Grains class", function(){			

			describe( 'returns the number of grains on the square', function(){

				it( '1', function(){
					expect( SUT.square( input='1' ) ).toBe( '1' );
				});

				it( '2', function(){
					expect( SUT.square( input='2' ) ).toBe( '2' );
				});

				it( '3', function(){
					expect( SUT.square( input='3' ) ).toBe( '4' );
				});

				it( '4', function(){
					expect( SUT.square( input='4' ) ).toBe( '8' );
				});

				it( '16', function(){
					expect( SUT.square( input='16' ) ).toBe( '32768' );
				});

				it( '32', function(){
					expect( SUT.square( input='32' ) ).toBe( '2147483648' );
				});

				it( '64', function(){
					expect( SUT.square( input='64' ) ).toBe( '9223372036854775808' );
				});

				it( 'square 0 raises an exception', function(){
					expect( SUT.square( input='0' ) ).toBe( '-1' );
				});

				it( 'negative square raises an exception', function(){
					expect( SUT.square( input='-1' ) ).toBe( '-1' );
				});

				it( 'square greater than 64 raises an exception', function(){
					expect( SUT.square( input='65' ) ).toBe( '-1' );
				});

			});

			it( 'returns the total number of grains on the board', function(){
				expect( SUT.total() ).toBe( 18446744073709551615 );
			});

		});
		
	}
 
}