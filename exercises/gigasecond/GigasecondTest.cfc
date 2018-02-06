component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Gigasecond' );
	}

	function run(){
	
		describe( "My Gigasecond class", function(){			

			describe( 'Add one gigasecond to the input.', function(){

				it( 'date only specification of time', function(){
					expect( SUT.add( birthdate='2011-04-25' ) ).toBe( '2043-01-01T01:46:40' );
				});

				it( 'second test for date only specification of time', function(){
					expect( SUT.add( birthdate='1977-06-13' ) ).toBe( '2009-02-19T01:46:40' );
				});

				it( 'third test for date only specification of time', function(){
					expect( SUT.add( birthdate='1959-07-19' ) ).toBe( '1991-03-27T01:46:40' );
				});

				it( 'full time specified', function(){
					expect( SUT.add( birthdate='2015-01-24T22:00:00' ) ).toBe( '2046-10-02T23:46:40' );
				});

				it( 'full time with day roll-over', function(){
					expect( SUT.add( birthdate='2015-01-24T23:59:59' ) ).toBe( '2046-10-03T01:46:39' );
				});

			});

		});
		
	}
 
}