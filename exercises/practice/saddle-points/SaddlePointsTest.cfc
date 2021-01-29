component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'SaddlePoints' );
	}

	function run(){
	
		describe( "My SaddlePoints class", function(){			

			it( 'Can identify single saddle point', function(){
				expect( SUT.saddlePoints( matrix=[[9, 8, 7], [5, 3, 2], [6, 6, 7]] ) ).toBe( [{"row":1,"column":0}] );
			});

			it( 'Can identify that empty matrix has no saddle points', function(){
				expect( SUT.saddlePoints( matrix=[[]] ) ).toBe( [] );
			});

			it( 'Can identify lack of saddle points when there are none', function(){
				expect( SUT.saddlePoints( matrix=[[1, 2, 3], [3, 1, 2], [2, 3, 1]] ) ).toBe( [] );
			});

			it( 'Can identify multiple saddle points', function(){
				expect( SUT.saddlePoints( matrix=[[4, 5, 4], [3, 5, 5], [1, 5, 4]] ) ).toBe( [{"row":0,"column":1},{"row":1,"column":1},{"row":2,"column":1}] );
			});

			it( 'Can identify saddle point in bottom right corner', function(){
				expect( SUT.saddlePoints( matrix=[[8, 7, 9], [6, 7, 6], [3, 2, 5]] ) ).toBe( [{"row":2,"column":2}] );
			});

		});
		
	}
 
}