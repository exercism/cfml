component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'CollatzConjecture' );
	}

	function run(){
	
		describe( "My CollatzConjecture class", function(){			

			it( 'zero steps for one', function(){
				expect( SUT.steps( number='1' ) ).toBe( '0' );
			});

			it( 'divide if even', function(){
				expect( SUT.steps( number='16' ) ).toBe( '4' );
			});

			it( 'even and odd steps', function(){
				expect( SUT.steps( number='12' ) ).toBe( '9' );
			});

			it( 'large number of even and odd steps', function(){
				expect( SUT.steps( number='1000000' ) ).toBe( '152' );
			});

			it( 'zero is an error', function(){
				expect( function(){ SUT.steps( number='0' ); } ).toThrow( message='Only positive integers are allowed' );
			});

			it( 'negative value is an error', function(){
				expect( function(){ SUT.steps( number='-15' ); } ).toThrow( message='Only positive integers are allowed' );
			});

		});
		
	}
 
}