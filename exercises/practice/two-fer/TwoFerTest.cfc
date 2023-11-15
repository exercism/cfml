component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'TwoFer' );
	}

	function run(){
	
		describe( "My TwoFer class", function(){			

			it( 'no name given', function(){
				expect( SUT.twoFer() ).toBe( 'One for you, one for me.' );
			});
			
			it( 'a name given', function(){
				expect( SUT.twoFer( name='Alice' ) ).toBe( 'One for Alice, one for me.' );
			});
			
			it( 'another name given', function(){
				expect( SUT.twoFer( name='Bob' ) ).toBe( 'One for Bob, one for me.' );
			});

		});
		
	}
 
}