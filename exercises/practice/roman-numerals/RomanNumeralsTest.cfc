component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'RomanNumerals' );
	}

	function run(){
	
		describe( "My RomanNumerals class", function(){			

			it( '1 is I', function(){
				expect( SUT.roman( number='1' ) ).toBe( 'I' );
			});

			it( '2 is II', function(){
				expect( SUT.roman( number='2' ) ).toBe( 'II' );
			});

			it( '3 is III', function(){
				expect( SUT.roman( number='3' ) ).toBe( 'III' );
			});

			it( '4 is IV', function(){
				expect( SUT.roman( number='4' ) ).toBe( 'IV' );
			});

			it( '5 is V', function(){
				expect( SUT.roman( number='5' ) ).toBe( 'V' );
			});

			it( '6 is VI', function(){
				expect( SUT.roman( number='6' ) ).toBe( 'VI' );
			});

			it( '9 is IX', function(){
				expect( SUT.roman( number='9' ) ).toBe( 'IX' );
			});

			it( '16 is XVI', function(){
				expect( SUT.roman( number='16' ) ).toBe( 'XVI' );
			});

			it( '27 is XXVII', function(){
				expect( SUT.roman( number='27' ) ).toBe( 'XXVII' );
			});

			it( '48 is XLVIII', function(){
				expect( SUT.roman( number='48' ) ).toBe( 'XLVIII' );
			});

			it( '49 is XLIX', function(){
				expect( SUT.roman( number='49' ) ).toBe( 'XLIX' );
			});

			it( '59 is LIX', function(){
				expect( SUT.roman( number='59' ) ).toBe( 'LIX' );
			});

			it( '66 is LXVI', function(){
				expect( SUT.roman( number='66' ) ).toBe( 'LXVI' );
			});

			it( '93 is XCIII', function(){
				expect( SUT.roman( number='93' ) ).toBe( 'XCIII' );
			});

			it( '141 is CXLI', function(){
				expect( SUT.roman( number='141' ) ).toBe( 'CXLI' );
			});

			it( '163 is CLXIII', function(){
				expect( SUT.roman( number='163' ) ).toBe( 'CLXIII' );
			});

			it( '166 is CLXVI', function(){
				expect( SUT.roman( number='166' ) ).toBe( 'CLXVI' );
			});

			it( '402 is CDII', function(){
				expect( SUT.roman( number='402' ) ).toBe( 'CDII' );
			});

			it( '575 is DLXXV', function(){
				expect( SUT.roman( number='575' ) ).toBe( 'DLXXV' );
			});

			it( '666 is DCLXVI', function(){
				expect( SUT.roman( number='666' ) ).toBe( 'DCLXVI' );
			});

			it( '911 is CMXI', function(){
				expect( SUT.roman( number='911' ) ).toBe( 'CMXI' );
			});

			it( '1024 is MXXIV', function(){
				expect( SUT.roman( number='1024' ) ).toBe( 'MXXIV' );
			});

			it( '1666 is MDCLXVI', function(){
				expect( SUT.roman( number='1666' ) ).toBe( 'MDCLXVI' );
			});

			it( '3000 is MMM', function(){
				expect( SUT.roman( number='3000' ) ).toBe( 'MMM' );
			});

			it( '3001 is MMMI', function(){
				expect( SUT.roman( number='3001' ) ).toBe( 'MMMI' );
			});

			it( '3999 is MMMCMXCIX', function(){
				expect( SUT.roman( number='3999' ) ).toBe( 'MMMCMXCIX' );
			});

		});
		
	}
 
}