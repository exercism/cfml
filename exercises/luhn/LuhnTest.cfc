component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Luhn' );
	}

	function run(){
	
		describe( "My Luhn class", function(){			

			it( 'single digit strings can not be valid', function(){
				expect( SUT.valid( input='1' ) ).toBeFalse();
			});

			it( 'A single zero is invalid', function(){
				expect( SUT.valid( input='0' ) ).toBeFalse();
			});

			it( 'a simple valid SIN that remains valid if reversed', function(){
				expect( SUT.valid( input='059' ) ).toBeTrue();
			});

			it( 'a simple valid SIN that becomes invalid if reversed', function(){
				expect( SUT.valid( input='59' ) ).toBeTrue();
			});

			it( 'a valid Canadian SIN', function(){
				expect( SUT.valid( input='055 444 285' ) ).toBeTrue();
			});

			it( 'invalid Canadian SIN', function(){
				expect( SUT.valid( input='055 444 286' ) ).toBeFalse();
			});

			it( 'invalid credit card', function(){
				expect( SUT.valid( input='8273 1232 7352 0569' ) ).toBeFalse();
			});

			it( 'valid strings with a non-digit included become invalid', function(){
				expect( SUT.valid( input='055a 444 285' ) ).toBeFalse();
			});

			it( 'valid strings with punctuation included become invalid', function(){
				expect( SUT.valid( input='055-444-285' ) ).toBeFalse();
			});

			it( 'valid strings with symbols included become invalid', function(){
				expect( SUT.valid( input='055£ 444$ 285' ) ).toBeFalse();
			});

			it( 'single zero with space is invalid', function(){
				expect( SUT.valid( input=' 0' ) ).toBeFalse();
			});

			it( 'more than a single zero is valid', function(){
				expect( SUT.valid( input='0000 0' ) ).toBeTrue();
			});

			it( 'input digit 9 is correctly converted to output digit 9', function(){
				expect( SUT.valid( input='091' ) ).toBeTrue();
			});

		});
		
	}
 
}