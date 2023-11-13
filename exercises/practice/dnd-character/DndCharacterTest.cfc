component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'DndCharacter' );
	}

	function inRange( score ) {
		return score >= 3 && score <= 18;
	}

	function run(){
	
		describe( "My Dnd Character class", function(){			

			describe( 'ability modifier', function(){

				it( 'ability modifier for score 3 is -4', function(){
					expect( SUT.abilityModifier( 3 ) ).toBe( -4 );
				});

				it( 'ability modifier for score 4 is -43', function(){
					expect( SUT.abilityModifier( 4 ) ).toBe( -3 );
				});

				it( 'ability modifier for score 5 is -3', function(){
					expect( SUT.abilityModifier( 5 ) ).toBe( -3 );
				});

				it( 'ability modifier for score 6 is -2', function(){
					expect( SUT.abilityModifier( 6 ) ).toBe( -2 );
				});

				it( 'ability modifier for score 7 is -2', function(){
					expect( SUT.abilityModifier( 7 ) ).toBe( -2 );
				});

				it( 'ability modifier for score 8 is -1', function(){
					expect( SUT.abilityModifier( 8 ) ).toBe( -1 );
				});
			});

			describe( 'random', function(){

				it( 'random ability is within range', function(){
					for (i=1; i<=10; i++) {
						expect( SUT.ability() ).toSatisfy( inRange );
					}
				});

				it( 'random character is valid', function(){
					for (i=1; i<=10; i++) {
						expect( SUT.strength ).toSatisfy( inRange );
						expect( SUT.dexterity ).toSatisfy( inRange );
						expect( SUT.constitution ).toSatisfy( inRange );
						expect( SUT.intelligence ).toSatisfy( inRange );
						expect( SUT.wisdom ).toSatisfy( inRange );
						expect( SUT.charisma ).toSatisfy( inRange );
						expect( SUT.hitpoints ).toBe( 10 + SUT.abilityModifier( SUT.constitution ))
					}
				});

				it( 'each ability is only calculated once', function(){
					expect( SUT.strength ).toBe( SUT.strength );
					expect( SUT.dexterity ).toBe( SUT.dexterity );
					expect( SUT.constitution ).toBe( SUT.constitution );
					expect( SUT.intelligence ).toBe( SUT.intelligence );
					expect( SUT.wisdom ).toBe( SUT.wisdom );
					expect( SUT.charisma ).toBe( SUT.charisma );
				});

			});

		});
	}
}
