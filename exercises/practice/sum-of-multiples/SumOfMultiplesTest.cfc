component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'SumOfMultiples' );
	}

	function run(){
	
		describe( "My SumOfMultiples class", function(){			

			it( 'multiples of 3 or 5 up to 1', function(){
				expect( SUT.sum( factors=[3, 5], limit='1' ) ).toBe( '0' );
			});

			it( 'multiples of 3 or 5 up to 4', function(){
				expect( SUT.sum( factors=[3, 5], limit='4' ) ).toBe( '3' );
			});

			it( 'multiples of 3 up to 7', function(){
				expect( SUT.sum( factors=[3], limit='7' ) ).toBe( '9' );
			});

			it( 'multiples of 3 or 5 up to 10', function(){
				expect( SUT.sum( factors=[3, 5], limit='10' ) ).toBe( '23' );
			});

			it( 'multiples of 3 or 5 up to 100', function(){
				expect( SUT.sum( factors=[3, 5], limit='100' ) ).toBe( '2318' );
			});

			it( 'multiples of 3 or 5 up to 1000', function(){
				expect( SUT.sum( factors=[3, 5], limit='1000' ) ).toBe( '233168' );
			});

			it( 'multiples of 7, 13 or 17 up to 20', function(){
				expect( SUT.sum( factors=[7, 13, 17], limit='20' ) ).toBe( '51' );
			});

			it( 'multiples of 4 or 6 up to 15', function(){
				expect( SUT.sum( factors=[4, 6], limit='15' ) ).toBe( '30' );
			});

			it( 'multiples of 5, 6 or 8 up to 150', function(){
				expect( SUT.sum( factors=[5, 6, 8], limit='150' ) ).toBe( '4419' );
			});

			it( 'multiples of 5 or 25 up to 51', function(){
				expect( SUT.sum( factors=[5, 25], limit='51' ) ).toBe( '275' );
			});

			it( 'multiples of 43 or 47 up to 10000', function(){
				expect( SUT.sum( factors=[43, 47], limit='10000' ) ).toBe( '2203160' );
			});

			it( 'multiples of 1 up to 100', function(){
				expect( SUT.sum( factors=[1], limit='100' ) ).toBe( '4950' );
			});

			it( 'multiples of an empty list up to 10000', function(){
				expect( SUT.sum( factors=[], limit='10000' ) ).toBe( '0' );
			});

		});
		
	}
 
}