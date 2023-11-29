component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'BinarySearch' );
	}

	function run(){
	
		describe( "My BinarySearch class", function(){			

			it( 'finds a value in an array with one element', function(){
				expect( SUT.find( array=[6], value='6' ) ).toBe( '1' );
			});

			it( 'finds a value in the middle of an array', function(){
				expect( SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='6' ) ).toBe( '4' );
			});

			it( 'finds a value at the beginning of an array', function(){
				expect( SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='1' ) ).toBe( '1' );
			});

			it( 'finds a value at the end of an array', function(){
				expect( SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='11' ) ).toBe( '7' );
			});

			it( 'finds a value in an array of odd length', function(){
				expect( SUT.find( array=[1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], value='144' ) ).toBe( '10' );
			});

			it( 'finds a value in an array of even length', function(){
				expect( SUT.find( array=[1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], value='21' ) ).toBe( '6' );
			});

			it( 'identifies that a value is not included in the array', function(){
				expect( function(){ SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='7' ); } ).toThrow( message='value not in array' );
			});

			it( 'a value smaller than the array''s smallest value is not found', function(){
				expect( function(){ SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='0' ); } ).toThrow( message='value not in array' );
			});

			it( 'a value larger than the array''s largest value is not found', function(){
				expect( function(){ SUT.find( array=[1, 3, 4, 6, 8, 9, 11], value='13' ); } ).toThrow( message='value not in array' );
			});

			it( 'nothing is found in an empty array', function(){
				expect( function(){ SUT.find( array=[], value='1' ); } ).toThrow( message='value not in array' );
			});

			it( 'nothing is found when the left and right bounds cross', function(){
				expect( function(){ SUT.find( array=[1, 2], value='0' ); } ).toThrow( message='value not in array' );
			});

		});
		
	}
 
}