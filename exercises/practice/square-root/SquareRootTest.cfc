component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'SquareRoot' );
	}

	function run(){
	
		describe( "My SquareRoot class", function(){			

			it( 'root of 1', function(){
				expect( SUT.squareRoot( radicand='1' ) ).toBe( '1' );
			});

			it( 'root of 4', function(){
				expect( SUT.squareRoot( radicand='4' ) ).toBe( '2' );
			});

			it( 'root of 25', function(){
				expect( SUT.squareRoot( radicand='25' ) ).toBe( '5' );
			});

			it( 'root of 81', function(){
				expect( SUT.squareRoot( radicand='81' ) ).toBe( '9' );
			});

			it( 'root of 196', function(){
				expect( SUT.squareRoot( radicand='196' ) ).toBe( '14' );
			});

			it( 'root of 65025', function(){
				expect( SUT.squareRoot( radicand='65025' ) ).toBe( '255' );
			});

		});
		
	}
 
}