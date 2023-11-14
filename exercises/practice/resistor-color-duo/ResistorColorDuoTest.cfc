component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ResistorColorDuo' );
	}

	function run(){
	
		describe( "My ResistorColorDuo class", function(){			

			it( 'Brown and black', function(){
				expect( SUT.value( colors=["brown", "black"] ) ).toBe( '10' );
			});

			it( 'Blue and grey', function(){
				expect( SUT.value( colors=["blue", "grey"] ) ).toBe( '68' );
			});

			it( 'Yellow and violet', function(){
				expect( SUT.value( colors=["yellow", "violet"] ) ).toBe( '47' );
			});

			it( 'White and red', function(){
				expect( SUT.value( colors=["white", "red"] ) ).toBe( '92' );
			});

			it( 'Orange and orange', function(){
				expect( SUT.value( colors=["orange", "orange"] ) ).toBe( '33' );
			});

			it( 'Ignore additional colors', function(){
				expect( SUT.value( colors=["green", "brown", "orange"] ) ).toBe( '51' );
			});

			it( 'Black and brown, one-digit', function(){
				expect( SUT.value( colors=["black", "brown"] ) ).toBe( '1' );
			});

		});
		
	}
 
}