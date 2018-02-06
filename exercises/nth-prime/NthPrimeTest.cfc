component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'NthPrime' );
	}

	function run(){
	
		describe( "My NthPrime class", function(){			

			it( 'first prime', function(){
				expect( SUT.prime( number='1' ) ).toBe( '2' );
			});

			it( 'second prime', function(){
				expect( SUT.prime( number='2' ) ).toBe( '3' );
			});

			it( 'sixth prime', function(){
				expect( SUT.prime( number='6' ) ).toBe( '13' );
			});

			it( 'big prime', function(){
				expect( SUT.prime( number='10001' ) ).toBe( '104743' );
			});

			it( 'there is no zeroth prime', function(){
				expect( function(){ SUT.prime( number='0' ); } ).toThrow( message='there is no zeroth prime' );
			});

		});
		
	}
 
}