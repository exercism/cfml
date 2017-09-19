component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'SpaceAge' );
	}

	function run(){
	
		describe( "My SpaceAge class", function(){			

			it( 'age on Earth', function(){
				expect( SUT.age( planet='Earth', seconds='1000000000' ) ).toBe( '31.69' );
			});

			it( 'age on Mercury', function(){
				expect( SUT.age( planet='Mercury', seconds='2134835688' ) ).toBe( '280.88' );
			});

			it( 'age on Venus', function(){
				expect( SUT.age( planet='Venus', seconds='189839836' ) ).toBe( '9.78' );
			});

			it( 'age on Mars', function(){
				expect( SUT.age( planet='Mars', seconds='2329871239' ) ).toBe( '39.25' );
			});

			it( 'age on Jupiter', function(){
				expect( SUT.age( planet='Jupiter', seconds='901876382' ) ).toBe( '2.41' );
			});

			it( 'age on Saturn', function(){
				expect( SUT.age( planet='Saturn', seconds='3000000000' ) ).toBe( '3.23' );
			});

			it( 'age on Uranus', function(){
				expect( SUT.age( planet='Uranus', seconds='3210123456' ) ).toBe( '1.21' );
			});

			it( 'age on Neptune', function(){
				expect( SUT.age( planet='Neptune', seconds='8210123456' ) ).toBe( '1.58' );
			});

		});
		
	}
 
}