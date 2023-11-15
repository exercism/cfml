component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Darts' );
	}

	function run(){
	
		describe( "My Darts class", function(){			
	
			it( 'Missed target', function(){
				expect( SUT.score( x=-9, y=9 ) ).toBe( 0 );
			});

			it( 'On the outer circle', function(){
				expect( SUT.score( x=0, y=10 ) ).toBe( 1 );
			});
			
			it( 'On the middle circle', function(){
				expect( SUT.score( x=-5, y=0 ) ).toBe( 5 );
			});

			it( 'On the inner circle', function(){
				expect( SUT.score( x=0, y=-1 ) ).toBe( 10 );
			});

			it( 'Exactly on center', function(){
				expect( SUT.score( x=0, y=0 ) ).toBe( 10 );
			});

			it( 'Near the center', function(){
				expect( SUT.score( x=-0.1, y=-0.1 ) ).toBe( 10 );
			});

			it( 'Just within the inner circle', function(){
				expect( SUT.score( x=0.7, y=0.7 ) ).toBe( 10 );
			});
			
			it( 'Just outside the inner circle', function(){
				expect( SUT.score( x=0.8, y=-0.8 ) ).toBe( 5 );
			});
			
			it( 'Just within the middle circle', function(){
				expect( SUT.score( x=-3.5, y=3.5 ) ).toBe( 5 );
			});
			
			it( 'Just outside the middle circle', function(){
				expect( SUT.score( x=-3.6, y=-3.6 ) ).toBe( 1 );
			});
			
			it( 'Just within the outer circle', function(){
				expect( SUT.score( x=-7.0, y=7.0 ) ).toBe( 1 );
			});
			
			it( 'Just outside the outer circle', function(){
				expect( SUT.score( x=7.1, y=-7.1 ) ).toBe( 0 );
			});

			it( 'Asymmetric position between the inner and middle circles', function(){
				expect( SUT.score( x=0.5, y=-4 ) ).toBe( 5 );
			});

		});

	}

}