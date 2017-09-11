component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( '@@name@@' );
	}

	function run(){
	
		describe( "My @@name@@ class", function(){
			
			it( "should ...", function(){
				expect( SUT.methodCall() ).toBe( 'Test value' );
			});
		});
		
	}
 
}