component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Hamming' );
	}

	function run(){
	
		describe( "My Hamming class", function(){			

			it( 'empty strands', function(){
				expect( SUT.distance( strand1='', strand2='' ) ).toBe( '0' );
			});

			it( 'identical strands', function(){
				expect( SUT.distance( strand1='A', strand2='A' ) ).toBe( '0' );
			});

			it( 'long identical strands', function(){
				expect( SUT.distance( strand1='GGACTGA', strand2='GGACTGA' ) ).toBe( '0' );
			});

			it( 'complete distance in single nucleotide strands', function(){
				expect( SUT.distance( strand1='A', strand2='G' ) ).toBe( '1' );
			});

			it( 'complete distance in small strands', function(){
				expect( SUT.distance( strand1='AG', strand2='CT' ) ).toBe( '2' );
			});

			it( 'small distance in small strands', function(){
				expect( SUT.distance( strand1='AT', strand2='CT' ) ).toBe( '1' );
			});

			it( 'small distance', function(){
				expect( SUT.distance( strand1='GGACG', strand2='GGTCG' ) ).toBe( '1' );
			});

			it( 'small distance in long strands', function(){
				expect( SUT.distance( strand1='ACCAGGG', strand2='ACTATGG' ) ).toBe( '2' );
			});

			it( 'non-unique character in first strand', function(){
				expect( SUT.distance( strand1='AAG', strand2='AAA' ) ).toBe( '1' );
			});

			it( 'non-unique character in second strand', function(){
				expect( SUT.distance( strand1='AAA', strand2='AAG' ) ).toBe( '1' );
			});

			it( 'same nucleotides in different positions', function(){
				expect( SUT.distance( strand1='TAG', strand2='GAT' ) ).toBe( '2' );
			});

			it( 'large distance', function(){
				expect( SUT.distance( strand1='GATACA', strand2='GCATAA' ) ).toBe( '4' );
			});

			it( 'large distance in off-by-one strand', function(){
				expect( SUT.distance( strand1='GGACGGATTCTG', strand2='AGGACGGATTCT' ) ).toBe( '9' );
			});

			it( 'disallow first strand longer', function(){
				expect( function(){ SUT.distance( strand1='AATG', strand2='AAA' ); } ).toThrow( message='left and right strands must be of equal length' );
			});

			it( 'disallow second strand longer', function(){
				expect( function(){ SUT.distance( strand1='ATA', strand2='AGTG' ); } ).toThrow( message='left and right strands must be of equal length' );
			});

		});
		
	}
 
}