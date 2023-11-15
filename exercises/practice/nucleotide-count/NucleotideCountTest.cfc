component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'NucleotideCount' );
	}

	function run(){
	
		describe( "My NucleotideCount class", function(){			

			it( 'empty strand', function(){
				expect( SUT.nucleotideCounts( strand='' ) ).toBe( {"A":0,"C":0,"G":0,"T":0} );
			});

			it( 'can count one nucleotide in single-character input', function(){
				expect( SUT.nucleotideCounts( strand='G' ) ).toBe( {"A":0,"C":0,"G":1,"T":0} );
			});

			it( 'strand with repeated nucleotide', function(){
				expect( SUT.nucleotideCounts( strand='GGGGGGG' ) ).toBe( {"A":0,"C":0,"G":7,"T":0} );
			});

			it( 'strand with multiple nucleotides', function(){
				expect( SUT.nucleotideCounts( strand='AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC' ) ).toBe( {"A":20,"C":12,"G":17,"T":21} );
			});

			it( 'strand with invalid nucleotides', function(){
				expect( function(){ SUT.nucleotideCounts( strand='AGXXACT' ); } ).toThrow( message='Invalid nucleotide in strand' );
			});

		});
		
	}
 
}