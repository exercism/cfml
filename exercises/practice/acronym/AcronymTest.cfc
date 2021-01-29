component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Acronym' );
	}

	function run(){
	
		describe( "My Acronym class", function(){			

			describe( 'Abbreviate a phrase', function(){

				it( 'basic', function(){
					expect( SUT.abbreviate( phrase='Portable Network Graphics' ) ).toBe( 'PNG' );
				});

				it( 'lowercase words', function(){
					expect( SUT.abbreviate( phrase='Ruby on Rails' ) ).toBe( 'ROR' );
				});

				it( 'punctuation', function(){
					expect( SUT.abbreviate( phrase='First In,  First Out' ) ).toBe( 'FIFO' );
				});

				it( 'all caps word', function(){
					expect( SUT.abbreviate( phrase='GNU Image Manipulation Program' ) ).toBe( 'GIMP' );
				});

				it( 'punctuation without whitespace', function(){
					expect( SUT.abbreviate( phrase='Complementary metal-oxide semiconductor' ) ).toBe( 'CMOS' );
				});

			});

		});
		
	}
 
}