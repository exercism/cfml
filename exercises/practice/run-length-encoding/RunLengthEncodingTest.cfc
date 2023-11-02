component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'runLengthEncoding' );
	}

	function run(){

		describe( "My Run Length Encoding class", function(){			

			// run-length encode a string
	
			it( 'empty string', function(){
				expect( SUT.encode( input='' ) ).toBe( '' );
			});

			it( 'single characters only are encoded without count', function(){
				expect( SUT.encode( input='XYZ' ) ).toBe( 'XYZ' );
			});

			it( 'string with no single characters', function(){
				expect( SUT.encode( input='AABBBCCCC' ) ).toBe( '2A3B4C' );
			});

			it( 'single characters mixed with repeated characters', function(){
				expect( SUT.encode( input='WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB' ) ).toBe( '12WB12W3B24WB' );
			});

			it( 'multiple whitespace mixed in string', function(){
				expect( SUT.encode( input='  hsqq qww  ' ) ).toBe( '2 hs2q q2w2 ' );
			});

			it( 'lowercase characters', function(){
				expect( SUT.encode( input='aabbbcccc' ) ).toBe( '2a3b4c' );
			});

			// run-length decode a string
	
			it( 'empty string', function(){
				expect( SUT.decode( input='' ) ).toBe( '' );
			});

			it( 'single characters only', function(){
				expect( SUT.decode( input='XYZ' ) ).toBe( 'XYZ' );
			});

			it( 'string with no single characters', function(){
				expect( SUT.decode( input='2A3B4C' ) ).toBe( 'AABBBCCCC' );
			});

			it( 'single characters with repeated characters', function(){
				expect( SUT.decode( input='12WB12W3B24WB' ) ).toBe( 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB' );
			});

			it( 'multiple whitespace mixed in string', function(){
				expect( SUT.decode( input='2 hs2q q2w2 ' ) ).toBe( '  hsqq qww  ' );
			});

			it( 'lowercase string', function(){
				expect( SUT.decode( input='2a3b4c' ) ).toBe( 'aabbbcccc' );
			});

			// encode and then decode

			it( 'encode followed by decode gives original string', function(){
				expect( SUT.decode( SUT.encode( input='zzz ZZ  zZ' ) ) ).toBe( 'zzz ZZ  zZ' );
			});
		

	});
		
	}
 
}