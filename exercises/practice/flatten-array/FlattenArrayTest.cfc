component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'FlattenArray' );
	}

	function run(){
	
		describe( "My FlattenArray class", function(){			

			it( 'empty', function(){
				expect( SUT.flatten( array=[] ) ).toBe( [] );
			});

			it( 'no nesting', function(){
				expect( SUT.flatten( array=[0, 1, 2] ) ).toBe( [0,1,2] );
			});

			it( 'flattens a nested array', function(){
				expect( SUT.flatten( array=[[[]]] ) ).toBe( [] );
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

			it( 'null values are omitted from the final result', function(){
				expect( SUT.flatten( array=[1, 2, nullValue()] ) ).toBe( [1,2] );
			});

			it( 'consecutive null values at the front of the list are omitted from the final result', function(){
				expect( SUT.flatten( array=[nullValue(), nullValue(), 3] ) ).toBe( [3] );
			});

			it( 'consecutive null values in the middle of the list are omitted from the final result', function(){
				expect( SUT.flatten( array=[1, nullValue(), nullValue(), 4] ) ).toBe( [1,4] );
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