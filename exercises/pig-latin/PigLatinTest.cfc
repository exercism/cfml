component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'PigLatin' );
	}

	function run(){
	
		describe( "My PigLatin class", function(){			

			describe( 'ay is added to words that start with vowels', function(){

				it( 'word beginning with a', function(){
					expect( SUT.translate( phrase='apple' ) ).toBe( 'appleay' );
				});

				it( 'word beginning with e', function(){
					expect( SUT.translate( phrase='ear' ) ).toBe( 'earay' );
				});

				it( 'word beginning with i', function(){
					expect( SUT.translate( phrase='igloo' ) ).toBe( 'iglooay' );
				});

				it( 'word beginning with o', function(){
					expect( SUT.translate( phrase='object' ) ).toBe( 'objectay' );
				});

				it( 'word beginning with u', function(){
					expect( SUT.translate( phrase='under' ) ).toBe( 'underay' );
				});

				it( 'word beginning with a vowel and followed by a qu', function(){
					expect( SUT.translate( phrase='equal' ) ).toBe( 'equalay' );
				});

			});

			describe( 'first letter and ay are moved to the end of words that start with consonants', function(){

				it( 'word beginning with p', function(){
					expect( SUT.translate( phrase='pig' ) ).toBe( 'igpay' );
				});

				it( 'word beginning with k', function(){
					expect( SUT.translate( phrase='koala' ) ).toBe( 'oalakay' );
				});

				it( 'word beginning with x', function(){
					expect( SUT.translate( phrase='xenon' ) ).toBe( 'enonxay' );
				});

				it( 'word beginning with q without a following u', function(){
					expect( SUT.translate( phrase='qat' ) ).toBe( 'atqay' );
				});

			});

			describe( 'some letter clusters are treated like a single consonant', function(){

				it( 'word beginning with ch', function(){
					expect( SUT.translate( phrase='chair' ) ).toBe( 'airchay' );
				});

				it( 'word beginning with qu', function(){
					expect( SUT.translate( phrase='queen' ) ).toBe( 'eenquay' );
				});

				it( 'word beginning with qu and a preceding consonant', function(){
					expect( SUT.translate( phrase='square' ) ).toBe( 'aresquay' );
				});

				it( 'word beginning with th', function(){
					expect( SUT.translate( phrase='therapy' ) ).toBe( 'erapythay' );
				});

				it( 'word beginning with thr', function(){
					expect( SUT.translate( phrase='thrush' ) ).toBe( 'ushthray' );
				});

				it( 'word beginning with sch', function(){
					expect( SUT.translate( phrase='school' ) ).toBe( 'oolschay' );
				});

			});

			describe( 'some letter clusters are treated like a single vowel', function(){

				it( 'word beginning with yt', function(){
					expect( SUT.translate( phrase='yttria' ) ).toBe( 'yttriaay' );
				});

				it( 'word beginning with xr', function(){
					expect( SUT.translate( phrase='xray' ) ).toBe( 'xrayay' );
				});

			});

			describe( 'position of y in a word determines if it is a consonant or a vowel', function(){

				it( 'y is treated like a consonant at the beginning of a word', function(){
					expect( SUT.translate( phrase='yellow' ) ).toBe( 'ellowyay' );
				});

				it( 'y is treated like a vowel at the end of a consonant cluster', function(){
					expect( SUT.translate( phrase='rhythm' ) ).toBe( 'ythmrhay' );
				});

				it( 'y as second letter in two letter word', function(){
					expect( SUT.translate( phrase='my' ) ).toBe( 'ymay' );
				});

			});

			describe( 'phrases are translated', function(){

				it( 'a whole phrase', function(){
					expect( SUT.translate( phrase='quick fast run' ) ).toBe( 'ickquay astfay unray' );
				});

			});

		});
		
	}
 
}