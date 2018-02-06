component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'FlattenArray' );
	}

	function run(){
	
		describe( "My FlattenArray class", function(){			

			it( 'no nesting', function(){
				expect( SUT.flatten( array=[0, 1, 2] ) ).toBe( [0,1,2] );
			});

			it( 'flattens array with just integers present', function(){
				expect( SUT.flatten( array=[1, [2, 3, 4, 5, 6, 7], 8] ) ).toBe( [1,2,3,4,5,6,7,8] );
			});

			it( '5 level nesting', function(){
				expect( SUT.flatten( array=[0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2] ) ).toBe( [0,2,2,3,8,100,4,50,-2] );
			});

			it( '6 level nesting', function(){
				expect( SUT.flatten( array=[1, [2, [[3]], [4, [[5]]], 6, 7], 8] ) ).toBe( [1,2,3,4,5,6,7,8] );
			});

			it( '6 level nest list with null values', function(){
				expect( SUT.flatten( array=[0, 2, [[2, 3], 8, [[100]], nullValue(), [[nullValue()]]], -2] ) ).toBe( [0,2,2,3,8,100,-2] );
			});

			it( 'all values in nested list are null', function(){
				expect( SUT.flatten( array=[nullValue(), [[[nullValue()]]], nullValue(), nullValue(), [[nullValue(), nullValue()], nullValue()], nullValue()] ) ).toBe( [] );
			});

		});
		
	}
 
}