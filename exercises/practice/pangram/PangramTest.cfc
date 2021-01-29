component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Pangram' );
	}

	function run(){
	
		describe( "My Pangram class", function(){			

			describe( 'Check if the given string is an pangram', function(){

				it( 'sentence empty', function(){
					expect( SUT.isPangram( sentence='' ) ).toBeFalse();
				});

				it( 'recognizes a perfect lower case pangram', function(){
					expect( SUT.isPangram( sentence='abcdefghijklmnopqrstuvwxyz' ) ).toBeTrue();
				});

				it( 'pangram with only lower case', function(){
					expect( SUT.isPangram( sentence='the quick brown fox jumps over the lazy dog' ) ).toBeTrue();
				});

				it( 'missing character ''x''', function(){
					expect( SUT.isPangram( sentence='a quick movement of the enemy will jeopardize five gunboats' ) ).toBeFalse();
				});

				it( 'another missing character, e.g. ''h''', function(){
					expect( SUT.isPangram( sentence='five boxing wizards jump quickly at it' ) ).toBeFalse();
				});

				it( 'pangram with underscores', function(){
					expect( SUT.isPangram( sentence='the_quick_brown_fox_jumps_over_the_lazy_dog' ) ).toBeTrue();
				});

				it( 'pangram with numbers', function(){
					expect( SUT.isPangram( sentence='the 1 quick brown fox jumps over the 2 lazy dogs' ) ).toBeTrue();
				});

				it( 'missing letters replaced by numbers', function(){
					expect( SUT.isPangram( sentence='7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog' ) ).toBeFalse();
				});

				it( 'pangram with mixed case and punctuation', function(){
					expect( SUT.isPangram( sentence='"Five quacking Zephyrs jolt my wax bed."' ) ).toBeTrue();
				});

				it( 'upper and lower case versions of the same character should not be counted separately', function(){
					expect( SUT.isPangram( sentence='the quick brown fox jumps over with lazy FX' ) ).toBeFalse();
				});

			});

		});
		
	}
 
}