component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Diamond' );
	}

	function run(){
	
		describe( "My Diamond class", function(){			

			it( 'Degenerate case with a single ''A'' row', function(){
				expect( SUT.rows( letter='A' ) ).toBe( ["A"] );
			});

			it( 'Degenerate case with no row containing 3 distinct groups of spaces', function(){
				expect( SUT.rows( letter='B' ) ).toBe( [" A ","B B"," A "] );
			});

			it( 'Smallest non-degenerate case with odd diamond side length', function(){
				expect( SUT.rows( letter='C' ) ).toBe( ["  A  "," B B ","C   C"," B B ","  A  "] );
			});

			it( 'Smallest non-degenerate case with even diamond side length', function(){
				expect( SUT.rows( letter='D' ) ).toBe( ["   A   ","  B B  "," C   C ","D     D"," C   C ","  B B  ","   A   "] );
			});

			it( 'Largest possible diamond', function(){
				expect( SUT.rows( letter='Z' ) ).toBe( ["                         A                         ","                        B B                        ","                       C   C                       ","                      D     D                      ","                     E       E                     ","                    F         F                    ","                   G           G                   ","                  H             H                  ","                 I               I                 ","                J                 J                ","               K                   K               ","              L                     L              ","             M                       M             ","            N                         N            ","           O                           O           ","          P                             P          ","         Q                               Q         ","        R                                 R        ","       S                                   S       ","      T                                     T      ","     U                                       U     ","    V                                         V    ","   W                                           W   ","  X                                             X  "," Y                                               Y ","Z                                                 Z"," Y                                               Y ","  X                                             X  ","   W                                           W   ","    V                                         V    ","     U                                       U     ","      T                                     T      ","       S                                   S       ","        R                                 R        ","         Q                               Q         ","          P                             P          ","           O                           O           ","            N                         N            ","             M                       M             ","              L                     L              ","               K                   K               ","                J                 J                ","                 I               I                 ","                  H             H                  ","                   G           G                   ","                    F         F                    ","                     E       E                     ","                      D     D                      ","                       C   C                       ","                        B B                        ","                         A                         "] );
			});

		});
		
	}
 
}