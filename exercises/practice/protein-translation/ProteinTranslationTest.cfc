component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'ProteinTranslation' );
	}

	function run(){
	
		describe( "My ProteinTranslation class", function(){			

			it( 'Empty RNA sequence results in no proteins', function(){
				expect( SUT.proteins( strand='' ) ).toBe( [] );
			});

			it( 'Methionine RNA sequence', function(){
				expect( SUT.proteins( strand='AUG' ) ).toBe( ['Methionine'] );
			});

			it( 'Phenylalanine RNA sequence 1', function(){
				expect( SUT.proteins( strand='UUU' ) ).toBe( ['Phenylalanine'] );
			});

			it( 'Phenylalanine RNA sequence 2', function(){
				expect( SUT.proteins( strand='UUC' ) ).toBe( ['Phenylalanine'] );
			});

			it( 'Leucine RNA sequence 1', function(){
				expect( SUT.proteins( strand='UUA' ) ).toBe( ['Leucine'] );
			});

			it( 'Leucine RNA sequence 2', function(){
				expect( SUT.proteins( strand='UUG' ) ).toBe( ['Leucine'] );
			});

			it( 'Serine RNA sequence 1', function(){
				expect( SUT.proteins( strand='UCU' ) ).toBe( ['Serine'] );
			});

			it( 'Serine RNA sequence 2', function(){
				expect( SUT.proteins( strand='UCC' ) ).toBe( ['Serine'] );
			});

			it( 'Serine RNA sequence 3', function(){
				expect( SUT.proteins( strand='UCA' ) ).toBe( ['Serine'] );
			});

			it( 'Serine RNA sequence 4', function(){
				expect( SUT.proteins( strand='UCG' ) ).toBe( ['Serine'] );
			});

			it( 'Tyrosine RNA sequence 1', function(){
				expect( SUT.proteins( strand='UAU' ) ).toBe( ['Tyrosine'] );
			});

			it( 'Tyrosine RNA sequence 2', function(){
				expect( SUT.proteins( strand='UAC' ) ).toBe( ['Tyrosine'] );
			});

			it( 'Cysteine RNA sequence 1', function(){
				expect( SUT.proteins( strand='UGU' ) ).toBe( ['Cysteine'] );
			});

			it( 'Cysteine RNA sequence 2', function(){
				expect( SUT.proteins( strand='UGC' ) ).toBe( ['Cysteine'] );
			});

			it( 'Tryptophan RNA sequence', function(){
				expect( SUT.proteins( strand='UGG' ) ).toBe( ['Tryptophan'] );
			});

			it( 'STOP codon RNA sequence 1', function(){
				expect( SUT.proteins( strand='UAA' ) ).toBe( [] );
			});

			it( 'STOP codon RNA sequence 2', function(){
				expect( SUT.proteins( strand='UAG' ) ).toBe( [] );
			});

			it( 'STOP codon RNA sequence 3', function(){
				expect( SUT.proteins( strand='UGA' ) ).toBe( [] );
			});

			it( 'Sequence of two protein codons translates into proteins', function(){
				expect( SUT.proteins( strand='UUUUUU' ) ).toBe( ['Phenylalanine', 'Phenylalanine'] );
			});

			it( 'Sequence of two different protein codons translates into proteins', function(){
				expect( SUT.proteins( strand='UUAUUG' ) ).toBe( ['Leucine', 'Leucine'] );
			});

			it( 'Translate RNA strand into correct protein list', function(){
				expect( SUT.proteins( strand='AUGUUUUGG' ) ).toBe( ['Methionine','Phenylalanine', 'Tryptophan'] );
			});

			it( 'Translation stops if STOP codon at beginning of sequence', function(){
				expect( SUT.proteins( strand='UAGUGG' ) ).toBe( [] );
			});

			it( 'Translation stops if STOP codon at end of two-codon sequence', function(){
				expect( SUT.proteins( strand='UGGUAG' ) ).toBe( ['Tryptophan'] );
			});

			it( 'Translation stops if STOP codon at end of three-codon sequence', function(){
				expect( SUT.proteins( strand='AUGUUUUAA' ) ).toBe( [ 'Methionine', 'Phenylalanine' ] );
			});

			it( 'Translation stops if STOP codon in middle of three-codon sequence', function(){
				expect( SUT.proteins( strand='UGGUAGUGG' ) ).toBe( ['Tryptophan'] );
			});

			it( 'Translation stops if STOP codon in middle of six-codon sequence', function(){
				expect( SUT.proteins( strand='UGGUGUUAUUAAUGGUUU' ) ).toBe( ['Tryptophan', 'Cysteine' ,'Tyrosine'] );
			});

			it( 'Non-existing codon can''t translate', function(){
				expect( function(){ SUT.proteins( strand='AAA' ); } ).toThrow( message='Invalid codon' );
			});

			it( 'Unknown amino acids, not part of a codon, can''t translate', function(){
				expect( function(){ SUT.proteins( strand='XYZ' ); } ).toThrow( message='Invalid codon' );
			});

			it( 'Incomplete RNA sequence can''t translate', function(){
				expect( function(){ SUT.proteins( strand='AUGU' ); } ).toThrow( message='Invalid codon' );
			});

			it( 'Incomplete RNA sequence can translate if valid until a STOP codon', function(){
				expect( SUT.proteins( strand='UUCUUCUAAUGGU' ) ).toBe( ['Phenylalanine', 'Phenylalanine'] );
			});

		});
		
	}
 
}