component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Strain' );
	}

	function alwaysTrue( x ) { return true; }

	function alwaysFalse( x ) { return false; }

	function isOdd( x ) { return x % 2 == 1; }

	function isEven( x ) { return x % 2 == 0; }

	function containsFive( x ) { return arrayContains(x, 5); }

	function startWithZ( x ) { return left(x, 1) == 'z'; }

	function run(){
	
		describe( "My Strain class", function(){			

			it( 'keep on empty list returns empty list', function(){
				expect( SUT.keep( list=[], predicate=alwaysTrue ) ).toBe( [] );
			});

			it( 'keeps everything', function(){
				expect( SUT.keep( list=[1, 3, 5], predicate=alwaysTrue ) ).toBe( [1,3,5] );
			});

			it( 'keeps nothing', function(){
				expect( SUT.keep( list=[1, 3, 5], predicate=alwaysFalse) ).toBe( [] );
			});

			it( 'keeps first and last', function(){
				expect( SUT.keep( list=[1, 2, 3], predicate=isOdd ) ).toBe( [1,3] );
			});

			it( 'keeps neither first nor last', function(){
				expect( SUT.keep( list=[1, 2, 3], predicate=isEven ) ).toBe( [2] );
			});

			it( 'keeps strings', function(){
				expect( SUT.keep(
					list=["apple",
						  "zebra",
						  "banana",
						  "zombies",
						  "cherimoya",
						  "zealot"],
					predicate=startWithZ ) ).toBe( ["zebra","zombies","zealot"] );
			});

			it( 'keeps lists', function(){
				expect( SUT.keep(
					list=[[1, 2, 3],
						  [5, 5, 5],
						  [5, 1, 2],
						  [2, 1, 2],
						  [1, 5, 2],
						  [2, 2, 1],
						  [1, 2, 5]],
					predicate=containsFive ) ).toBe( [[5,5,5],
													  [5,1,2],
													  [1,5,2],
													  [1,2,5]] );
			});

			it( 'discard on empty list returns empty list', function(){
				expect( SUT.discard( list=[], predicate=alwaysTrue ) ).toBe( [] );
			});

			it( 'discards everything', function(){
				expect( SUT.discard( list=[1, 3, 5], predicate=alwaysTrue ) ).toBe( [] );
			});

			it( 'discards nothing', function(){
				expect( SUT.discard( list=[1, 3, 5], predicate=alwaysFalse ) ).toBe( [1,3,5] );
			});

			it( 'discards first and last', function(){
				expect( SUT.discard( list=[1, 2, 3], predicate=isOdd ) ).toBe( [2] );
			});

			it( 'discards neither first nor last', function(){
				expect( SUT.discard( list=[1, 2, 3], predicate=isEven ) ).toBe( [1,3] );
			});

			it( 'discards strings', function(){
				expect( SUT.discard(
					list=["apple",
						  "zebra",
						  "banana",
						  "zombies",
						  "cherimoya",
						  "zealot"],
					predicate=startWithZ ) ).toBe( ["apple",
													"banana",
													"cherimoya"] );
			});

			it( 'discards lists', function(){
				expect( SUT.discard(
					list=[[1, 2, 3],
						  [5, 5, 5],
						  [5, 1, 2],
						  [2, 1, 2],
						  [1, 5, 2],
						  [2, 2, 1],
						  [1, 2, 5]],
					predicate=containsFive ) ).toBe( [[1,2,3],
													  [2,1,2],
													  [2,2,1]] );
			});

		});
		
	}
 
}containsFive