component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'SecretHandshake' );
	}

	function run(){
	
		describe( "My SecretHandshake class", function(){			

			describe( 'Create a handshake for a number', function(){

				it( 'wink for 1', function(){
					expect( SUT.commands( number='1' ) ).toBe( ["wink"] );
				});

				it( 'double blink for 10', function(){
					expect( SUT.commands( number='2' ) ).toBe( ["double blink"] );
				});

				it( 'close your eyes for 100', function(){
					expect( SUT.commands( number='4' ) ).toBe( ["close your eyes"] );
				});

				it( 'jump for 1000', function(){
					expect( SUT.commands( number='8' ) ).toBe( ["jump"] );
				});

				it( 'combine two actions', function(){
					expect( SUT.commands( number='3' ) ).toBe( ["wink","double blink"] );
				});

				it( 'reverse two actions', function(){
					expect( SUT.commands( number='19' ) ).toBe( ["double blink","wink"] );
				});

				it( 'reversing one action gives the same action', function(){
					expect( SUT.commands( number='24' ) ).toBe( ["jump"] );
				});

				it( 'reversing no actions still gives no actions', function(){
					expect( SUT.commands( number='16' ) ).toBe( [] );
				});

				it( 'all possible actions', function(){
					expect( SUT.commands( number='15' ) ).toBe( ["wink","double blink","close your eyes","jump"] );
				});

				it( 'reverse all possible actions', function(){
					expect( SUT.commands( number='31' ) ).toBe( ["jump","close your eyes","double blink","wink"] );
				});

				it( 'do nothing for zero', function(){
					expect( SUT.commands( number='0' ) ).toBe( [] );
				});

			});

		});
		
	}
 
}