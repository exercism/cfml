component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'HelloWorld' );
	}

	function run(){
	
		describe( "My HelloWorld class", function(){			

			it( 'Say Hi!', function(){
				expect( SUT.hello() ).toBe( 'Hello, World!' );
			});

		});
		
	}
 
}