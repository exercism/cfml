component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Triangle' );
	}

	function run(){
	
		describe( "My Triangle class", function(){			

			describe( 'returns true if the triangle is equilateral', function(){

				it( 'true if all sides are equal', function(){
					expect( SUT.equilateral( sides=[2, 2, 2] ) ).toBeTrue();
				});

				it( 'false if any side is unequal', function(){
					expect( SUT.equilateral( sides=[2, 3, 2] ) ).toBeFalse();
				});

				it( 'false if no sides are equal', function(){
					expect( SUT.equilateral( sides=[5, 4, 6] ) ).toBeFalse();
				});

				it( 'All zero sides are illegal, so the triangle is not equilateral', function(){
					expect( SUT.equilateral( sides=[0, 0, 0] ) ).toBeFalse();
				});

				it( 'sides may be floats', function(){
					expect( SUT.equilateral( sides=[0.5, 0.5, 0.5] ) ).toBeTrue();
				});

			});

			describe( 'returns true if the triangle is isosceles', function(){

				it( 'true if last two sides are equal', function(){
					expect( SUT.isosceles( sides=[3, 4, 4] ) ).toBeTrue();
				});

				it( 'true if first two sides are equal', function(){
					expect( SUT.isosceles( sides=[4, 4, 3] ) ).toBeTrue();
				});

				it( 'true if first and last sides are equal', function(){
					expect( SUT.isosceles( sides=[4, 3, 4] ) ).toBeTrue();
				});

				it( 'equilateral triangles are also isosceles', function(){
					expect( SUT.isosceles( sides=[4, 4, 4] ) ).toBeTrue();
				});

				it( 'false if no sides are equal', function(){
					expect( SUT.isosceles( sides=[2, 3, 4] ) ).toBeFalse();
				});

				it( 'Sides that violate triangle inequality are not isosceles, even if two are equal', function(){
					expect( SUT.isosceles( sides=[1, 1, 3] ) ).toBeFalse();
				});

				it( 'sides may be floats', function(){
					expect( SUT.isosceles( sides=[0.5, 0.4, 0.5] ) ).toBeTrue();
				});

			});

			describe( 'returns true if the triangle is scalene', function(){

				it( 'true if no sides are equal', function(){
					expect( SUT.scalene( sides=[5, 4, 6] ) ).toBeTrue();
				});

				it( 'false if all sides are equal', function(){
					expect( SUT.scalene( sides=[4, 4, 4] ) ).toBeFalse();
				});

				it( 'false if two sides are equal', function(){
					expect( SUT.scalene( sides=[4, 4, 3] ) ).toBeFalse();
				});

				it( 'Sides that violate triangle inequality are not scalene, even if they are all different', function(){
					expect( SUT.scalene( sides=[7, 3, 2] ) ).toBeFalse();
				});

				it( 'sides may be floats', function(){
					expect( SUT.scalene( sides=[0.5, 0.4, 0.6] ) ).toBeTrue();
				});

			});

		});
		
	}
 
}