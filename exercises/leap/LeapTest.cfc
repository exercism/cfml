component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Leap' );
	}

	function run(){
	
		describe( "My Leap year calculator", function(){
			
			it( "should detect a leap year", function(){
				expect( SUT.isLeapYear( 1996 ) ).toBeTrue();
			});
			
			it( "should detect a non-leap year", function(){
				expect( SUT.isLeapYear( 1997 ) ).toBeFalse();
			});
			
			it( "should detect a non-leap even year", function(){
				expect( SUT.isLeapYear( 1998 ) ).toBeFalse();
			});
			
			it( "should detect a century", function(){
				expect( SUT.isLeapYear( 1900 ) ).toBeFalse();
			});
			
			it( "should detect a fourth century", function(){
				expect( SUT.isLeapYear( 2400 ) ).toBeTrue();
			});
			
			it( "should detect Y2K", function(){
				expect( SUT.isLeapYear( 2000 ) ).toBeTrue();
			});
			
		});
		
	}
 
}