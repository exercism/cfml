component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ResistorColor' );
	}

	function run(){
	
		describe( "My ResistorColor class", function(){			

			describe( 'Color codes', function(){

				it( 'Black', function(){
					expect( SUT.colorCode( color='black' ) ).toBe( '0' );
				});

				it( 'White', function(){
					expect( SUT.colorCode( color='white' ) ).toBe( '9' );
				});

				it( 'Orange', function(){
					expect( SUT.colorCode( color='orange' ) ).toBe( '3' );
				});

			});

			it( 'Colors', function(){
				expect( SUT.colors() ).toBe( ["black","brown","red","orange","yellow","green","blue","violet","grey","white"] );
			});

		});
		
	}
 
}