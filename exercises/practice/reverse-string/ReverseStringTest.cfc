component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ReverseString' );
	}

	function run(){
	
		describe( "My ReverseString class", function(){			

			it( 'an empty string', function(){
				expect( SUT.reverse( value='' ) ).toBe( '' );
			});

			it( 'a word', function(){
				expect( SUT.reverse( value='robot' ) ).toBe( 'tobor' );
			});

			it( 'a capitalized word', function(){
				expect( SUT.reverse( value='Ramen' ) ).toBe( 'nemaR' );
			});

			it( 'a sentence with punctuation', function(){
				expect( SUT.reverse( value='I''m hungry!' ) ).toBe( '!yrgnuh m''I' );
			});

			it( 'a palindrome', function(){
				expect( SUT.reverse( value='racecar' ) ).toBe( 'racecar' );
			});

			it( 'an even-sized word', function(){
				expect( SUT.reverse( value='drawer' ) ).toBe( 'reward' );
			});

		});
		
	}
 
}