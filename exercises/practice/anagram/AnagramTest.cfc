component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Anagram' );
	}

	function run(){
	
		describe( "My Anagram class", function(){			

			it( 'no matches', function(){
				expect( SUT.anagrams( subject='diaper', candidates=["hello", "world", "zombies", "pants"] ) ).toBe( [] );
			});

			it( 'detects two anagrams', function(){
				expect( SUT.anagrams( subject='master', candidates=["stream", "pigeon", "maters"] ) ).toBe( ["stream","maters"] );
			});

			it( 'does not detect anagram subsets', function(){
				expect( SUT.anagrams( subject='good', candidates=["dog", "goody"] ) ).toBe( [] );
			});

			it( 'detects anagram', function(){
				expect( SUT.anagrams( subject='listen', candidates=["enlists", "google", "inlets", "banana"] ) ).toBe( ["inlets"] );
			});

			it( 'detects three anagrams', function(){
				expect( SUT.anagrams( subject='allergy', candidates=["gallery", "ballerina", "regally", "clergy", "largely", "leading"] ) ).toBe( ["gallery","regally","largely"] );
			});

			it( 'does not detect non-anagrams with identical checksum', function(){
				expect( SUT.anagrams( subject='mass', candidates=["last"] ) ).toBe( [] );
			});

			it( 'detects anagrams case-insensitively', function(){
				expect( SUT.anagrams( subject='Orchestra', candidates=["cashregister", "Carthorse", "radishes"] ) ).toBe( ["Carthorse"] );
			});

			it( 'detects anagrams using case-insensitive subject', function(){
				expect( SUT.anagrams( subject='Orchestra', candidates=["cashregister", "carthorse", "radishes"] ) ).toBe( ["carthorse"] );
			});

			it( 'detects anagrams using case-insensitive possible matches', function(){
				expect( SUT.anagrams( subject='orchestra', candidates=["cashregister", "Carthorse", "radishes"] ) ).toBe( ["Carthorse"] );
			});

			it( 'does not detect a anagram if the original word is repeated', function(){
				expect( SUT.anagrams( subject='go', candidates=["go Go GO"] ) ).toBe( [] );
			});

			it( 'anagrams must use all letters exactly once', function(){
				expect( SUT.anagrams( subject='tapper', candidates=["patter"] ) ).toBe( [] );
			});

			it( 'capital word is not own anagram', function(){
				expect( SUT.anagrams( subject='BANANA', candidates=["Banana"] ) ).toBe( [] );
			});

		});
		
	}
 
}