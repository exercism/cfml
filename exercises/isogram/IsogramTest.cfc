component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Isogram' );
	}

	function run(){
	
		describe( "My Isogram class", function(){			

			describe( 'Check if the given string is an isogram', function(){

				it( 'empty string', function(){
					expect( SUT.isIsogram( input='' ) ).toBeTrue();
				});

				it( 'isogram with only lower case characters', function(){
					expect( SUT.isIsogram( input='isogram' ) ).toBeTrue();
				});

				it( 'word with one duplicated character', function(){
					expect( SUT.isIsogram( input='eleven' ) ).toBeFalse();
				});

				it( 'longest reported english isogram', function(){
					expect( SUT.isIsogram( input='subdermatoglyphic' ) ).toBeTrue();
				});

				it( 'word with duplicated character in mixed case', function(){
					expect( SUT.isIsogram( input='Alphabet' ) ).toBeFalse();
				});

				it( 'hypothetical isogrammic word with hyphen', function(){
					expect( SUT.isIsogram( input='thumbscrew-japingly' ) ).toBeTrue();
				});

				it( 'isogram with duplicated hyphen', function(){
					expect( SUT.isIsogram( input='six-year-old' ) ).toBeTrue();
				});

				it( 'made-up name that is an isogram', function(){
					expect( SUT.isIsogram( input='Emily Jung Schwartzkopf' ) ).toBeTrue();
				});

				it( 'duplicated character in the middle', function(){
					expect( SUT.isIsogram( input='accentor' ) ).toBeFalse();
				});

			});

		});
		
	}
 
}