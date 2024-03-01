component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ListOps' );
	}

	function run(){
	
		describe( "My ListOps class", function(){			

			describe( 'append entries to a list and return the new list', function(){

				it( 'empty lists', function(){
					expect( SUT.append( list1=[], list2=[] ) ).toBe( [] );
				});

				it( 'list to empty list', function(){
					expect( SUT.append( list1=[], list2=[1, 2, 3, 4] ) ).toBe( [1,2,3,4] );
				});

				it( 'empty list to list', function(){
					expect( SUT.append( list1=[1, 2, 3, 4], list2=[] ) ).toBe( [1,2,3,4] );
				});

				it( 'non-empty lists', function(){
					expect( SUT.append( list1=[1, 2], list2=[2, 3, 4, 5] ) ).toBe( [1,2,2,3,4,5] );
				});

			});

			describe( 'concatenate a list of lists', function(){

				it( 'empty list', function(){
					expect( SUT.concat( lists=[] ) ).toBe( [] );
				});

				it( 'list of lists', function(){
					expect( SUT.concat( lists=[[1, 2], [3], [], [4, 5, 6]] ) ).toBe( [1,2,3,4,5,6] );
				});

				it( 'list of nested lists', function(){
					expect( SUT.concat( lists=[[[1], [2]], [[3]], [[]], [[4, 5, 6]]] ) ).toBe( [[1],[2],[3],[],[4,5,6]] );
				});

			});

			describe( 'filter list returning only values that satisfy the filter function', function(){

				it( 'empty list', function(){
					fn = function( n ) { return n % 2 == 1; };
					expect( SUT.filter( list=[], fn=fn ) ).toBe( [] );
				});

				it( 'non-empty list', function(){
					fn = function( n ) { return n % 2 == 1; };
					expect( SUT.filter( list=[1, 2, 3, 5], fn=fn ) ).toBe( [1,3,5] );
				});

			});

			describe( 'returns the length of a list', function(){

				it( 'empty list', function(){
					expect( SUT.length( list=[] ) ).toBe( 0 );
				});

				it( 'non-empty list', function(){
					expect( SUT.length( list=[1, 2, 3, 4] ) ).toBe( 4 );
				});

			});

			describe( 'return a list of elements whose values equal the list value transformed by the mapping function', function(){

				it( 'empty list', function(){
					fn = function( x ) { return x + 1; };
					expect( SUT.map( list=[], fn=fn ) ).toBe( [] );
				});

				it( 'non-empty list', function(){
					fn = function( x ) { return x + 1; };
					expect( SUT.map( list=[1, 3, 5, 7], fn=fn ) ).toBe( [2,4,6,8] );
				});

			});

			describe( 'folds (reduces) the given list from the left with a function', function(){

				it( 'empty list', function(){
					fn = function( acc, el ) { return el * acc; };
					expect( SUT.foldl( list=[],  fn=fn, initial=2 ) ).toBe( 2 );
				});

				it( 'direction independent function applied to non-empty list', function(){
					fn = function( acc, el ) { return el + acc; };
					expect( SUT.foldl( list=[1, 2, 3, 4], fn=fn, initial=5 ) ).toBe( 15 );
				});

				it( 'direction dependent function applied to non-empty list', function(){
					fn = function( acc, el ) { return el / acc; };
					expect( SUT.foldl( list=[1, 2, 3, 4], fn=fn, initial=24 ) ).toBe( 64 );
				});

			});

			describe( 'folds (reduces) the given list from the right with a function', function(){

				it( 'empty list', function(){
					fn = function( acc, el ) { return el * acc; };
					expect( SUT.foldr( list=[], fn=fn, initial=2 ) ).toBe( 2 );
				});

				it( 'direction independent function applied to non-empty list', function(){
					fn = function( acc, el ) { return el + acc; };
					expect( SUT.foldr( list=[1, 2, 3, 4], fn=fn, initial=5 ) ).toBe( 15 );
				});

				it( 'direction dependent function applied to non-empty list', function(){
					fn = function( acc, el ) { return el / acc; };
					expect( SUT.foldr( list=[1, 2, 3, 4], fn=fn, initial=24 ) ).toBe( 9 );
				});

			});

			describe( 'reverse the elements of the list', function(){

				it( 'empty list', function(){
					expect( SUT.reverse( list=[] ) ).toBe( [] );
				});

				it( 'non-empty list', function(){
					expect( SUT.reverse( list=[1, 3, 5, 7] ) ).toBe( [7,5,3,1] );
				});

				it( 'list of lists is not flattened', function(){
					expect( SUT.reverse( list=[[1, 2], [3], [], [4, 5, 6]] ) ).toBe( [[4,5,6],[],[3],[1,2]] );
				});

			});

		});
		
	}
 
}