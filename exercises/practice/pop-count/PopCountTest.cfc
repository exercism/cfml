component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'PopCount' );
	}

	function run(){
	
		describe( "My PopCount class", function(){			

			it( '0 eggs', function(){
				expect( SUT.eggCount( number='0' ) ).toBe( '0' );
			});

			it( '1 egg', function(){
				expect( SUT.eggCount( number='16' ) ).toBe( '1' );
			});

			it( '4 eggs', function(){
				expect( SUT.eggCount( number='89' ) ).toBe( '4' );
			});

			it( '13 eggs', function(){
				expect( SUT.eggCount( number='2000000000' ) ).toBe( '13' );
			});

		});
		
	}
 
}