component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ScrabbleScore' );
	}

	function run(){
	
		describe( "My ScrabbleScore class", function(){			

			it( 'lowercase letter', function(){
				expect( SUT.score( word='a' ) ).toBe( '1' );
			});

			it( 'uppercase letter', function(){
				expect( SUT.score( word='A' ) ).toBe( '1' );
			});

			it( 'valuable letter', function(){
				expect( SUT.score( word='f' ) ).toBe( '4' );
			});

			it( 'short word', function(){
				expect( SUT.score( word='at' ) ).toBe( '2' );
			});

			it( 'short, valuable word', function(){
				expect( SUT.score( word='zoo' ) ).toBe( '12' );
			});

			it( 'medium word', function(){
				expect( SUT.score( word='street' ) ).toBe( '6' );
			});

			it( 'medium, valuable word', function(){
				expect( SUT.score( word='quirky' ) ).toBe( '22' );
			});

			it( 'long, mixed-case word', function(){
				expect( SUT.score( word='OxyphenButazone' ) ).toBe( '41' );
			});

			it( 'english-like word', function(){
				expect( SUT.score( word='pinata' ) ).toBe( '8' );
			});

			it( 'empty input', function(){
				expect( SUT.score( word='' ) ).toBe( '0' );
			});

			it( 'entire alphabet available', function(){
				expect( SUT.score( word='abcdefghijklmnopqrstuvwxyz' ) ).toBe( '87' );
			});

		});
		
	}
 
}