component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'QueenAttack' );
	}

	function run(){
	
		describe( "My QueenAttack class", function(){			

			// Test creation of Queens with valid and invalid positions

			it( 'queen with a valid position', function(){
				expect( SUT.create( row = 2, col = 2 ) ).notToBeEmpty();
			});

			it( 'queen must have positive row', function(){
				expect( SUT.create( row = -2, col = 2 ) ).toBeFalse();
			});

			it( 'queen must have row on board', function(){
				expect( SUT.create( row = 8, col = 4 ) ).toBeFalse();
			});

			it( 'queen must have positive column', function(){
				expect( SUT.create( row = 2, col = -2 ) ).toBeFalse();
			});
			it( 'queen must have column on board', function(){
				expect( SUT.create( row = 4, col = 8 ) ).toBeFalse();
			});

			// Test the ability of one queen to attack another

			it( 'cannot attack', function(){
				whiteQueen = SUT.create( row = 2, col = 4 );
				blackQueen = SUT.create( row = 6, col = 6 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeFalse();
			});

			it( 'can attack on same row', function(){
				whiteQueen = SUT.create( row = 2, col = 4 );
				blackQueen = SUT.create( row = 2, col = 6 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'can attack on same column', function(){
				whiteQueen = SUT.create( row = 4, col = 5 );
				blackQueen = SUT.create( row = 2, col = 5 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'can attack on first diagonal', function(){
				whiteQueen = SUT.create( row = 2, col = 2 );
				blackQueen = SUT.create( row = 0, col = 4 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'can attack on second diagonal', function(){
				whiteQueen = SUT.create( row = 2, col = 2 );
				blackQueen = SUT.create( row = 3, col = 1 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'can attack on third diagonal', function(){
				whiteQueen = SUT.create( row = 2, col = 2 );
				blackQueen = SUT.create( row = 1, col = 1 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'can attack on fourth diagonal', function(){
				whiteQueen = SUT.create( row = 1, col = 7 );
				blackQueen = SUT.create( row = 0, col = 6 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeTrue();
			});

			it( 'cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal', function(){
				whiteQueen = SUT.create( row = 4, col = 1 );
				blackQueen = SUT.create( row = 2, col = 5 );
				expect( SUT.canAttack( whiteQueen, blackQueen) ).toBeFalse();
			});



		});
		
	}
 
}