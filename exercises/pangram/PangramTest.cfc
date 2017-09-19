component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Pangram' );
	}

	function run(){
	
		describe( "My Pangram class", function(){			

			describe( 'Check if the given string is an pangram', function(){

				it( 'sentence empty', function(){
					expect( SUT.isPangram( input='' ) ).toBeFalse();
				});

				it( 'pangram with only lower case', function(){
					expect( SUT.isPangram( input='the quick brown fox jumps over the lazy dog' ) ).toBeTrue();
				});

				it( 'missing character ''x''', function(){
					expect( SUT.isPangram( input='a quick movement of the enemy will jeopardize five gunboats' ) ).toBeFalse();
				});

				it( 'another missing character ''x''', function(){
					expect( SUT.isPangram( input='the quick brown fish jumps over the lazy dog' ) ).toBeFalse();
				});

				it( 'pangram with underscores', function(){
					expect( SUT.isPangram( input='the_quick_brown_fox_jumps_over_the_lazy_dog' ) ).toBeTrue();
				});

				it( 'pangram with numbers', function(){
					expect( SUT.isPangram( input='the 1 quick brown fox jumps over the 2 lazy dogs' ) ).toBeTrue();
				});

				it( 'missing letters replaced by numbers', function(){
					expect( SUT.isPangram( input='7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog' ) ).toBeFalse();
				});

				it( 'pangram with mixed case and punctuation', function(){
					expect( SUT.isPangram( input='"Five quacking Zephyrs jolt my wax bed."' ) ).toBeTrue();
				});

				it( 'upper and lower case versions of the same character should not be counted separately', function(){
					expect( SUT.isPangram( input='the quick brown fox jumps over with lazy FX' ) ).toBeFalse();
				});

			});

		});
		
	}
 
}