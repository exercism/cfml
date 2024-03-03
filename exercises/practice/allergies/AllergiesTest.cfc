component extends="testbox.system.BaseSpec" {

	function run(){
	
		describe( "My Allergies class", function(){			

			describe( 'testing for eggs allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='eggs') ).toBeFalse();
				});

				it( 'allergic only to eggs', function(){
					SUT = new Allergies( score = '1' );
					expect( SUT.allergicTo( item='eggs') ).toBeTrue();
				});

				it( 'allergic to eggs and something else', function(){
					SUT = new Allergies( score = '3' );
					expect( SUT.allergicTo( item='eggs' ) ).toBeTrue();
				});

				it( 'allergic to something, but not eggs', function(){
					SUT = new Allergies( score = '2' );
					expect( SUT.allergicTo( item='eggs' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='eggs' ) ).toBeTrue();
				});

			});

			describe( 'testing for peanuts allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='peanuts' ) ).toBeFalse();
				});

				it( 'allergic only to peanuts', function(){
					SUT = new Allergies( score = '2' );
					expect( SUT.allergicTo( item='peanuts' ) ).toBeTrue();
				});

				it( 'allergic to peanuts and something else', function(){
					SUT = new Allergies( score = '7' );
					expect( SUT.allergicTo( item='peanuts' ) ).toBeTrue();
				});

				it( 'allergic to something, but not peanuts', function(){
					SUT = new Allergies( score = '5' );
					expect( SUT.allergicTo( item='peanuts' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='peanuts' ) ).toBeTrue();
				});

			});

			describe( 'testing for shellfish allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='shellfish' ) ).toBeFalse();
				});

				it( 'allergic only to shellfish', function(){
					SUT = new Allergies( score = '4' );
					expect( SUT.allergicTo( item='shellfish' ) ).toBeTrue();
				});

				it( 'allergic to shellfish and something else', function(){
					SUT = new Allergies( score = '14' );
					expect( SUT.allergicTo( item='shellfish' ) ).toBeTrue();
				});

				it( 'allergic to something, but not shellfish', function(){
					SUT = new Allergies( score = '10' );
					expect( SUT.allergicTo( item='shellfish' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='shellfish' ) ).toBeTrue();
				});

			});

			describe( 'testing for strawberries allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='strawberries' ) ).toBeFalse();
				});

				it( 'allergic only to strawberries', function(){
					SUT = new Allergies( score = '8' );
					expect( SUT.allergicTo( item='strawberries' ) ).toBeTrue();
				});

				it( 'allergic to strawberries and something else', function(){
					SUT = new Allergies( score = '28' );
					expect( SUT.allergicTo( item='strawberries' ) ).toBeTrue();
				});

				it( 'allergic to something, but not strawberries', function(){
					SUT = new Allergies( score = '20' );
					expect( SUT.allergicTo( item='strawberries' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='strawberries' ) ).toBeTrue();
				});

			});

			describe( 'testing for tomatoes allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='tomatoes' ) ).toBeFalse();
				});

				it( 'allergic only to tomatoes', function(){
					SUT = new Allergies( score = '16' );
					expect( SUT.allergicTo( item='tomatoes' ) ).toBeTrue();
				});

				it( 'allergic to tomatoes and something else', function(){
					SUT = new Allergies( score = '56' );
					expect( SUT.allergicTo( item='tomatoes' ) ).toBeTrue();
				});

				it( 'allergic to something, but not tomatoes', function(){
					SUT = new Allergies( score = '40' );
					expect( SUT.allergicTo( item='tomatoes' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='tomatoes' ) ).toBeTrue();
				});

			});

			describe( 'testing for chocolate allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='chocolate' ) ).toBeFalse();
				});

				it( 'allergic only to chocolate', function(){
					SUT = new Allergies( score = '32' );
					expect( SUT.allergicTo( item='chocolate' ) ).toBeTrue();
				});

				it( 'allergic to chocolate and something else', function(){
					SUT = new Allergies( score = '112' );
					expect( SUT.allergicTo( item='chocolate' ) ).toBeTrue();
				});

				it( 'allergic to something, but not chocolate', function(){
					SUT = new Allergies( score = '80' );
					expect( SUT.allergicTo( item='chocolate' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='chocolate' ) ).toBeTrue();
				});

			});

			describe( 'testing for pollen allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='pollen' ) ).toBeFalse();
				});

				it( 'allergic only to pollen', function(){
					SUT = new Allergies( score = '64' );
					expect( SUT.allergicTo( item='pollen' ) ).toBeTrue();
				});

				it( 'allergic to pollen and something else', function(){
					SUT = new Allergies( score = '224' );
					expect( SUT.allergicTo( item='pollen' ) ).toBeTrue();
				});

				it( 'allergic to something, but not pollen', function(){
					SUT = new Allergies( score = '160' );
					expect( SUT.allergicTo( item='pollen' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='pollen' ) ).toBeTrue();
				});

			});

			describe( 'testing for cats allergy', function(){

				it( 'not allergic to anything', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.allergicTo( item='cats' ) ).toBeFalse();
				});

				it( 'allergic only to cats', function(){
					SUT = new Allergies( score = '128' );
					expect( SUT.allergicTo( item='cats' ) ).toBeTrue();
				});

				it( 'allergic to cats and something else', function(){
					SUT = new Allergies( score = '192' );
					expect( SUT.allergicTo( item='cats' ) ).toBeTrue();
				});

				it( 'allergic to something, but not cats', function(){
					SUT = new Allergies( score = '64' );
					expect( SUT.allergicTo( item='cats' ) ).toBeFalse();
				});

				it( 'allergic to everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.allergicTo( item='cats' ) ).toBeTrue();
				});

			});

			describe( 'list when:', function(){

				it( 'no allergies', function(){
					SUT = new Allergies( score = '0' );
					expect( SUT.list( ) ).toBe( [] );
				});

				it( 'just eggs', function(){
					SUT = new Allergies( score = '1' );
					expect( SUT.list( ) ).toBe( ["eggs"] );
				});

				it( 'just peanuts', function(){
					SUT = new Allergies( score = '2' );
					expect( SUT.list( ) ).toBe( ["peanuts"] );
				});

				it( 'just strawberries', function(){
					SUT = new Allergies( score = '8' );
					expect( SUT.list( ) ).toBe( ["strawberries"] );
				});

				it( 'eggs and peanuts', function(){
					SUT = new Allergies( score = '3' );
					expect( SUT.list( ) ).toBe( ["eggs","peanuts"] );
				});

				it( 'more than eggs but not peanuts', function(){
					SUT = new Allergies( score = '5' );
					expect( SUT.list( ) ).toBe( ["eggs","shellfish"] );
				});

				it( 'lots of stuff', function(){
					SUT = new Allergies( score = '248' );
					expect( SUT.list( ) ).toBe( ["strawberries","tomatoes","chocolate","pollen","cats"] );
				});

				it( 'everything', function(){
					SUT = new Allergies( score = '255' );
					expect( SUT.list( ) ).toBe( ["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"] );
				});

				it( 'no allergen score parts', function(){
					SUT = new Allergies( score = '509' );
					expect( SUT.list( ) ).toBe( ["eggs","shellfish","strawberries","tomatoes","chocolate","pollen","cats"] );
				});

				it( 'no allergen score parts without highest valid score', function(){
					SUT = new Allergies( score = '257' );
					expect( SUT.list( ) ).toBe( ["eggs"] );
				});

			});

		});
		
	}
 
}