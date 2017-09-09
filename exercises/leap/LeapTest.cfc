component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  leapObj = createObject( 'Leap' );
	}

	function run(){
	
		describe( "My Leap year calculator", function(){
			
			it( "should detect a leap year", function(){
				expect( leapObj.isLeapYear( 1996 ) ).toBeTrue();
			});
			
			it( "should detect a non-leap year", function(){
				expect( leapObj.isLeapYear( 1997 ) ).toBeFalse();
			});
			
			it( "should detect a non-leap even year", function(){
				expect( leapObj.isLeapYear( 1998 ) ).toBeFalse();
			});
			
			it( "should detect a century", function(){
				expect( leapObj.isLeapYear( 1900 ) ).toBeFalse();
			});
			
			it( "should detect a fourth century", function(){
				expect( leapObj.isLeapYear( 2400 ) ).toBeTrue();
			});
			
			it( "should detect Y2K", function(){
				expect( leapObj.isLeapYear( 2000 ) ).toBeTrue();
			});
			
		});
		
	}
 
}