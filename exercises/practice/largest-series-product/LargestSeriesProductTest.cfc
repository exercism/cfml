component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'LargestSeriesProduct' );
	}

	function run(){
	
		describe( "My LargestSeriesProduct class", function(){			

			it( 'finds the largest product if span equals length', function(){
				expect( SUT.largestProduct( digits='29', span='2' ) ).toBe( '18' );
			});

			it( 'can find the largest product of 2 with numbers in order', function(){
				expect( SUT.largestProduct( digits='0123456789', span='2' ) ).toBe( '72' );
			});

			it( 'can find the largest product of 2', function(){
				expect( SUT.largestProduct( digits='576802143', span='2' ) ).toBe( '48' );
			});

			it( 'can find the largest product of 3 with numbers in order', function(){
				expect( SUT.largestProduct( digits='0123456789', span='3' ) ).toBe( '504' );
			});

			it( 'can find the largest product of 3', function(){
				expect( SUT.largestProduct( digits='1027839564', span='3' ) ).toBe( '270' );
			});

			it( 'can find the largest product of 5 with numbers in order', function(){
				expect( SUT.largestProduct( digits='0123456789', span='5' ) ).toBe( '15120' );
			});

			it( 'can get the largest product of a big number', function(){
				expect( SUT.largestProduct( digits='73167176531330624919225119674426574742355349194934', span='6' ) ).toBe( '23520' );
			});

			it( 'reports zero if the only digits are zero', function(){
				expect( SUT.largestProduct( digits='0000', span='2' ) ).toBe( '0' );
			});

			it( 'reports zero if all spans include zero', function(){
				expect( SUT.largestProduct( digits='99099', span='3' ) ).toBe( '0' );
			});

			it( 'rejects span longer than string length', function(){
				expect( SUT.largestProduct( digits='123', span='4' ) ).toBe( '-1' );
			});

			it( 'reports 1 for empty string and empty product (0 span)', function(){
				expect( SUT.largestProduct( digits='', span='0' ) ).toBe( '1' );
			});

			it( 'reports 1 for nonempty string and empty product (0 span)', function(){
				expect( SUT.largestProduct( digits='123', span='0' ) ).toBe( '1' );
			});

			it( 'rejects empty string and nonzero span', function(){
				expect( SUT.largestProduct( digits='', span='1' ) ).toBe( '-1' );
			});

			it( 'rejects invalid character in digits', function(){
				expect( SUT.largestProduct( digits='1234a5', span='2' ) ).toBe( '-1' );
			});

			it( 'rejects negative span', function(){
				expect( SUT.largestProduct( digits='12345', span='-1' ) ).toBe( '-1' );
			});

		});
		
	}
 
}