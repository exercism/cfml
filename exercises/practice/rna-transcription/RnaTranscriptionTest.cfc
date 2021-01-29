component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'RnaTranscription' );
	}

	function run(){
	
		describe( "My RnaTranscription class", function(){			

			it( 'RNA complement of cytosine is guanine', function(){
				expect( SUT.toRna( dna='C' ) ).toBe( 'G' );
			});

			it( 'RNA complement of guanine is cytosine', function(){
				expect( SUT.toRna( dna='G' ) ).toBe( 'C' );
			});

			it( 'RNA complement of thymine is adenine', function(){
				expect( SUT.toRna( dna='T' ) ).toBe( 'A' );
			});

			it( 'RNA complement of adenine is uracil', function(){
				expect( SUT.toRna( dna='A' ) ).toBe( 'U' );
			});

			it( 'RNA complement', function(){
				expect( SUT.toRna( dna='ACGTGGTCTTAA' ) ).toBe( 'UGCACCAGAAUU' );
			});

		});
		
	}
 
}