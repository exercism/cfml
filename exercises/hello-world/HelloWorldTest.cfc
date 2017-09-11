component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  helloWorldObj = createObject( 'HelloWorld' );
	}

	function run(){
	
		describe( "My HelloWorld class", function(){
			
			it( "should greet the world", function(){
				expect( helloWorldObj.helloworld() ).toBe( 'Hello, world!' );
			});
		});
		
	}
 
}