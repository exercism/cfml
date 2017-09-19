component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'NthPrime' );
	}

	function run(){
	
		describe( "My NthPrime class", function(){			

			it( 'first prime', function(){
				expect( SUT.prime( input='1' ) ).toBe( '2' );
			});

			it( 'second prime', function(){
				expect( SUT.prime( input='2' ) ).toBe( '3' );
			});

			it( 'sixth prime', function(){
				expect( SUT.prime( input='6' ) ).toBe( '13' );
			});

			it( 'big prime', function(){
				expect( SUT.prime( input='10001' ) ).toBe( '104743' );
			});

			it( 'there is no zeroth prime', function(){
				expect( SUT.prime( input='0' ) ).toBeFalse();
			});

		});
		
	}
 
}