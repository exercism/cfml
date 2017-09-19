component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'DifferenceOfSquares' );
	}

	function run(){
	
		describe( "My DifferenceOfSquares class", function(){			

			describe( 'Square the sum of the numbers up to the given number', function(){

				it( 'square of sum 1', function(){
					expect( SUT.squareOfSum( number='1' ) ).toBe( '1' );
				});

				it( 'square of sum 5', function(){
					expect( SUT.squareOfSum( number='5' ) ).toBe( '225' );
				});

				it( 'square of sum 100', function(){
					expect( SUT.squareOfSum( number='100' ) ).toBe( '25502500' );
				});

			});

			describe( 'Sum the squares of the numbers up to the given number', function(){

				it( 'sum of squares 1', function(){
					expect( SUT.sumOfSquares( number='1' ) ).toBe( '1' );
				});

				it( 'sum of squares 5', function(){
					expect( SUT.sumOfSquares( number='5' ) ).toBe( '55' );
				});

				it( 'sum of squares 100', function(){
					expect( SUT.sumOfSquares( number='100' ) ).toBe( '338350' );
				});

			});

			describe( 'Subtract sum of squares from square of sums', function(){

				it( 'difference of squares 1', function(){
					expect( SUT.differenceOfSquares( number='1' ) ).toBe( '0' );
				});

				it( 'difference of squares 5', function(){
					expect( SUT.differenceOfSquares( number='5' ) ).toBe( '170' );
				});

				it( 'difference of squares 100', function(){
					expect( SUT.differenceOfSquares( number='100' ) ).toBe( '25164150' );
				});

			});

		});
		
	}
 
}