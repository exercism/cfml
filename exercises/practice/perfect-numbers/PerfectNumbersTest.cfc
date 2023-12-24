component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'PerfectNumbers' );
	}

	function run(){
	
		describe( "My PerfectNumbers class", function(){			

			describe( 'Perfect numbers', function(){

				it( 'Smallest perfect number is classified correctly', function(){
					expect( SUT.classify( number='6' ) ).toBe( 'perfect' );
				});

				it( 'Medium perfect number is classified correctly', function(){
					expect( SUT.classify( number='28' ) ).toBe( 'perfect' );
				});

				it( 'Large perfect number is classified correctly', function(){
					expect( SUT.classify( number='33550336' ) ).toBe( 'perfect' );
				});

			});

			describe( 'Abundant numbers', function(){

				it( 'Smallest abundant number is classified correctly', function(){
					expect( SUT.classify( number='12' ) ).toBe( 'abundant' );
				});

				it( 'Medium abundant number is classified correctly', function(){
					expect( SUT.classify( number='30' ) ).toBe( 'abundant' );
				});

				it( 'Large abundant number is classified correctly', function(){
					expect( SUT.classify( number='33550335' ) ).toBe( 'abundant' );
				});

			});

			describe( 'Deficient numbers', function(){

				it( 'Smallest prime deficient number is classified correctly', function(){
					expect( SUT.classify( number='2' ) ).toBe( 'deficient' );
				});

				it( 'Smallest non-prime deficient number is classified correctly', function(){
					expect( SUT.classify( number='4' ) ).toBe( 'deficient' );
				});

				it( 'Medium deficient number is classified correctly', function(){
					expect( SUT.classify( number='32' ) ).toBe( 'deficient' );
				});

				it( 'Large deficient number is classified correctly', function(){
					expect( SUT.classify( number='33550337' ) ).toBe( 'deficient' );
				});

				it( 'Edge case (no factors other than itself) is classified correctly', function(){
					expect( SUT.classify( number='1' ) ).toBe( 'deficient' );
				});

			});

			describe( 'Invalid inputs', function(){

				it( 'Zero is rejected (as it is not a positive integer)', function(){
					expect( function(){ SUT.classify( number='0' ); } ).toThrow( message='Classification is only possible for positive integers.' );
				});

				it( 'Negative integer is rejected (as it is not a positive integer)', function(){
					expect( function(){ SUT.classify( number='-1' ); } ).toThrow( message='Classification is only possible for positive integers.' );
				});

			});

		});
		
	}
 
}