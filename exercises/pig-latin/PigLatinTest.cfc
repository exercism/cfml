component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'PigLatin' );
	}

	function run(){
	
		describe( "My PigLatin class", function(){			

			describe( 'ay is added to words that start with vowels', function(){

				it( 'word beginning with a', function(){
					expect( SUT.translate( input='apple' ) ).toBe( 'appleay' );
				});

				it( 'word beginning with e', function(){
					expect( SUT.translate( input='ear' ) ).toBe( 'earay' );
				});

				it( 'word beginning with i', function(){
					expect( SUT.translate( input='igloo' ) ).toBe( 'iglooay' );
				});

				it( 'word beginning with o', function(){
					expect( SUT.translate( input='object' ) ).toBe( 'objectay' );
				});

				it( 'word beginning with u', function(){
					expect( SUT.translate( input='under' ) ).toBe( 'underay' );
				});

				it( 'word beginning with a vowel and followed by a qu', function(){
					expect( SUT.translate( input='equal' ) ).toBe( 'equalay' );
				});

			});

			describe( 'first letter and ay are moved to the end of words that start with consonants', function(){

				it( 'word beginning with p', function(){
					expect( SUT.translate( input='pig' ) ).toBe( 'igpay' );
				});

				it( 'word beginning with k', function(){
					expect( SUT.translate( input='koala' ) ).toBe( 'oalakay' );
				});

				it( 'word beginning with y', function(){
					expect( SUT.translate( input='yellow' ) ).toBe( 'ellowyay' );
				});

				it( 'word beginning with x', function(){
					expect( SUT.translate( input='xenon' ) ).toBe( 'enonxay' );
				});

				it( 'word beginning with q without a following u', function(){
					expect( SUT.translate( input='qat' ) ).toBe( 'atqay' );
				});

			});

			describe( 'some letter clusters are treated like a single consonant', function(){

				it( 'word beginning with ch', function(){
					expect( SUT.translate( input='chair' ) ).toBe( 'airchay' );
				});

				it( 'word beginning with qu', function(){
					expect( SUT.translate( input='queen' ) ).toBe( 'eenquay' );
				});

				it( 'word beginning with qu and a preceding consonant', function(){
					expect( SUT.translate( input='square' ) ).toBe( 'aresquay' );
				});

				it( 'word beginning with th', function(){
					expect( SUT.translate( input='therapy' ) ).toBe( 'erapythay' );
				});

				it( 'word beginning with thr', function(){
					expect( SUT.translate( input='thrush' ) ).toBe( 'ushthray' );
				});

				it( 'word beginning with sch', function(){
					expect( SUT.translate( input='school' ) ).toBe( 'oolschay' );
				});

			});

			describe( 'some letter clusters are treated like a single vowel', function(){

				it( 'word beginning with yt', function(){
					expect( SUT.translate( input='yttria' ) ).toBe( 'yttriaay' );
				});

				it( 'word beginning with xr', function(){
					expect( SUT.translate( input='xray' ) ).toBe( 'xrayay' );
				});

			});

			describe( 'phrases are translated', function(){

				it( 'a whole phrase', function(){
					expect( SUT.translate( input='quick fast run' ) ).toBe( 'ickquay astfay unray' );
				});

			});

		});
		
	}
 
}