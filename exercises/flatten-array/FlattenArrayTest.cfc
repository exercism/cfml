component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'FlattenArray' );
	}
	
	// Return a null value
	function null(){}

	function run(){
	
		describe( "My FlattenArray class", function(){			

			it( 'no nesting', function(){
				expect( SUT.flatten( input=[0, 1, 2] ) ).toBe( [0,1,2] );
			});

			it( 'flattens array with just integers present', function(){
				expect( SUT.flatten( input=[1, [2, 3, 4, 5, 6, 7], 8] ) ).toBe( [1,2,3,4,5,6,7,8] );
			});

			it( '5 level nesting', function(){
				expect( SUT.flatten( input=[0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2] ) ).toBe( [0,2,2,3,8,100,4,50,-2] );
			});

			it( '6 level nesting', function(){
				expect( SUT.flatten( input=[1, [2, [[3]], [4, [[5]]], 6, 7], 8] ) ).toBe( [1,2,3,4,5,6,7,8] );
			});

			it( '6 level nest list with null values', function(){
				expect( SUT.flatten( input=[0, 2, [[2, 3], 8, [[100]], null(), [[null()]]], -2] ) ).toBe( [0,2,2,3,8,100,-2] );
			});

			it( 'all values in nested list are null', function(){
				expect( SUT.flatten( input=[null(), [[[null()]]], null(), null(), [[null(), null()], null()], null()] ) ).toBe( [] );
			});

		});
		
	}
 
}