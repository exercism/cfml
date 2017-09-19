component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'HelloWorld' );
	}

	function run(){
	
		describe( "My HelloWorld class", function(){
			
			it( "should greet the world", function(){
				expect( SUT.helloworld() ).toBe( 'Hello, world!' );
			});
		});
		
	}
 
}