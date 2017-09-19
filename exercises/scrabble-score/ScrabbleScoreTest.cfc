component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ScrabbleScore' );
	}

	function run(){
	
		describe( "My ScrabbleScore class", function(){			

			it( 'lowercase letter', function(){
				expect( SUT.score( input='a' ) ).toBe( '1' );
			});

			it( 'uppercase letter', function(){
				expect( SUT.score( input='A' ) ).toBe( '1' );
			});

			it( 'valuable letter', function(){
				expect( SUT.score( input='f' ) ).toBe( '4' );
			});

			it( 'short word', function(){
				expect( SUT.score( input='at' ) ).toBe( '2' );
			});

			it( 'short, valuable word', function(){
				expect( SUT.score( input='zoo' ) ).toBe( '12' );
			});

			it( 'medium word', function(){
				expect( SUT.score( input='street' ) ).toBe( '6' );
			});

			it( 'medium, valuable word', function(){
				expect( SUT.score( input='quirky' ) ).toBe( '22' );
			});

			it( 'long, mixed-case word', function(){
				expect( SUT.score( input='OxyphenButazone' ) ).toBe( '41' );
			});

			it( 'english-like word', function(){
				expect( SUT.score( input='pinata' ) ).toBe( '8' );
			});

			it( 'empty input', function(){
				expect( SUT.score( input='' ) ).toBe( '0' );
			});

			it( 'entire alphabet available', function(){
				expect( SUT.score( input='abcdefghijklmnopqrstuvwxyz' ) ).toBe( '87' );
			});

		});
		
	}
 
}