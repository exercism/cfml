component extends="testbox.system.BaseSpec" {

	function run(){

		describe( "My RobotSimulator class", function(){

			describe( 'Create robot', function(){

				it( 'at origin facing north', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'north');
					robotB = new 'RobotSimulator'( 0, 0, 'north');
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'at negative position facing south', function(){
					robotA = new 'RobotSimulator'( -1, -1, 'south' );
					robotB = new 'RobotSimulator'( -1, -1, 'south' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

			});

			describe( 'Rotating clockwise', function(){

				it( 'changes north to east', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'north' );
					robotA.move('R');
					robotB = new 'RobotSimulator'( 0, 0, 'east' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes east to south', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'east' );
					robotA.move('R');
					robotB = new 'RobotSimulator'( 0, 0, 'south' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes south to west', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'south' );
					robotA.move('R');
					robotB = new 'RobotSimulator'( 0, 0, 'west' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes west to north', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'west' );
					robotA.move('R');
					robotB = new 'RobotSimulator'( 0, 0, 'north' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

			});

			describe( 'Rotating counter-clockwise', function(){

				it( 'changes north to west', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'north' );
					robotA.move('L');
					robotB = new 'RobotSimulator'( 0, 0, 'west' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes west to south', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'west' );
					robotA.move('L');
					robotB = new 'RobotSimulator'( 0, 0, 'south' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes south to east', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'south' );
					robotA.move('L');
					robotB = new 'RobotSimulator'( 0, 0, 'east' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'changes east to north', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'east' );
					robotA.move('L');
					robotB = new 'RobotSimulator'( 0, 0, 'north' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

			});

			describe( 'Moving forward one', function(){

				it( 'facing north increments Y', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'north' );
					robotA.move('A');
					robotB = new 'RobotSimulator'( 0, 1, 'north' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'facing south decrements Y', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'south' );
					robotA.move('A');
					robotB = new 'RobotSimulator'( 0, -1, 'south' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'facing east increments X', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'east' );
					robotA.move('A');
					robotB = new 'RobotSimulator'( 1, 0, 'east' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'facing west decrements X', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'west' );
					robotA.move('A');
					robotB = new 'RobotSimulator'( -1, 0, 'west' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

			});

			describe( 'Follow series of instructions', function(){

				it( 'moving east and north from README', function(){
					robotA = new 'RobotSimulator'( 7, 3, 'north' );
					robotA.move('RAALAL');
					robotB = new 'RobotSimulator'( 9, 4, 'west' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'moving west and north', function(){
					robotA = new 'RobotSimulator'( 0, 0, 'north' );
					robotA.move('LAAARALA');
					robotB = new 'RobotSimulator'( -4, 1, 'west' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'moving west and south', function(){
					robotA = new 'RobotSimulator'( 2, -7, 'east' );
					robotA.move('RRAAAAALA');
					robotB = new 'RobotSimulator'( -3, -8, 'south' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

				it( 'moving east and north', function(){
					robotA = new 'RobotSimulator'( 8, 4, 'south' );
					robotA.move('LAAARRRALLLL');
					robotB = new 'RobotSimulator'( 11, 5, 'north' );
					expect( objectEquals( robotA, robotB ) ).toBe( true );
				});

			});

		});

	}

}