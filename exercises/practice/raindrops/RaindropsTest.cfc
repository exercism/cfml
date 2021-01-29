component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Raindrops' );
	}

	function run(){
	
		describe( "My Raindrops class", function(){			

			it( 'the sound for 1 is 1', function(){
				expect( SUT.convert( number='1' ) ).toBe( '1' );
			});

			it( 'the sound for 3 is Pling', function(){
				expect( SUT.convert( number='3' ) ).toBe( 'Pling' );
			});

			it( 'the sound for 5 is Plang', function(){
				expect( SUT.convert( number='5' ) ).toBe( 'Plang' );
			});

			it( 'the sound for 7 is Plong', function(){
				expect( SUT.convert( number='7' ) ).toBe( 'Plong' );
			});

			it( 'the sound for 6 is Pling as it has a factor 3', function(){
				expect( SUT.convert( number='6' ) ).toBe( 'Pling' );
			});

			it( '2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base', function(){
				expect( SUT.convert( number='8' ) ).toBe( '8' );
			});

			it( 'the sound for 9 is Pling as it has a factor 3', function(){
				expect( SUT.convert( number='9' ) ).toBe( 'Pling' );
			});

			it( 'the sound for 10 is Plang as it has a factor 5', function(){
				expect( SUT.convert( number='10' ) ).toBe( 'Plang' );
			});

			it( 'the sound for 14 is Plong as it has a factor of 7', function(){
				expect( SUT.convert( number='14' ) ).toBe( 'Plong' );
			});

			it( 'the sound for 15 is PlingPlang as it has factors 3 and 5', function(){
				expect( SUT.convert( number='15' ) ).toBe( 'PlingPlang' );
			});

			it( 'the sound for 21 is PlingPlong as it has factors 3 and 7', function(){
				expect( SUT.convert( number='21' ) ).toBe( 'PlingPlong' );
			});

			it( 'the sound for 25 is Plang as it has a factor 5', function(){
				expect( SUT.convert( number='25' ) ).toBe( 'Plang' );
			});

			it( 'the sound for 27 is Pling as it has a factor 3', function(){
				expect( SUT.convert( number='27' ) ).toBe( 'Pling' );
			});

			it( 'the sound for 35 is PlangPlong as it has factors 5 and 7', function(){
				expect( SUT.convert( number='35' ) ).toBe( 'PlangPlong' );
			});

			it( 'the sound for 49 is Plong as it has a factor 7', function(){
				expect( SUT.convert( number='49' ) ).toBe( 'Plong' );
			});

			it( 'the sound for 52 is 52', function(){
				expect( SUT.convert( number='52' ) ).toBe( '52' );
			});

			it( 'the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7', function(){
				expect( SUT.convert( number='105' ) ).toBe( 'PlingPlangPlong' );
			});

			it( 'the sound for 3125 is Plang as it has a factor 5', function(){
				expect( SUT.convert( number='3125' ) ).toBe( 'Plang' );
			});

		});
		
	}
 
}