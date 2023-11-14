component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'AllYourBase' );
	  WriteDump(SUT);
	}

	function run(){
	
		describe( "My AllYourBase class", function(){			

			it( 'single bit one to decimal', function(){
				expect( SUT.rebase( inputBase=2, digits=[1], outputBase=10 ) ).toBe( [1] );
			});

			it( 'binary to single decimal', function(){
				expect( SUT.rebase( inputBase=2, digits=[1, 0, 1], outputBase=10 ) ).toBe( [5] );
			});

			it( 'single decimal to binary', function(){
				expect( SUT.rebase( inputBase=10, digits=[5], outputBase=2 ) ).toBe( [1, 0, 1] );
			});

			it( 'binary to multiple decimal', function(){
				expect( SUT.rebase( inputBase=2, digits=[1, 0, 1, 0, 1, 0], outputBase=10 ) ).toBe( [4, 2] );
			});

			it( 'decimal to binary', function(){
				expect( SUT.rebase( inputBase=10, digits=[4, 2], outputBase=2 ) ).toBe( [1, 0, 1, 0, 1, 0] );
			});

			it( 'trinary to hexadecimal', function(){
				expect( SUT.rebase( inputBase=3, digits=[1, 1, 2, 0], outputBase=16 ) ).toBe( [2, 10] );
			});

			it( 'hexadecimal to trinary', function(){
				expect( SUT.rebase( inputBase=16, digits=[2, 10], outputBase=3 ) ).toBe( [1, 1, 2, 0] );
			});

			it( '15-bit integer', function(){
				expect( SUT.rebase( inputBase=97, digits=[3, 46, 60], outputBase=73 ) ).toBe( [6, 10, 45] );
			});

			it( 'empty list', function(){
				expect( SUT.rebase( inputBase=2, digits=[], outputBase=10 ) ).toBe( [0] );
			});

			it( 'single zero', function(){
				expect( SUT.rebase( inputBase=10, digits=[0], outputBase=2 ) ).toBe( [0] );
			});

			it( 'multiple zeros', function(){
				expect( SUT.rebase( inputBase=10, digits=[0, 0, 0], outputBase=2 ) ).toBe( [0] );
			});

			it( 'leading zeros', function(){
				expect( SUT.rebase( inputBase=7, digits=[0, 6, 0], outputBase=10 ) ).toBe( [4, 2] );
			});

			// input base must be >= 2
			it( 'input base is one', function(){
				expect( SUT.rebase( inputBase=1, digits=[0], outputBase=10 ) ).toBe( -1 );
			});

			it( 'input base is zero', function(){
				expect( SUT.rebase( inputBase=0, digits=[], outputBase=10 ) ).toBe( -1 );
			});

			it( 'input base is negative', function(){
				expect( SUT.rebase( inputBase=-2, digits=[1], outputBase=10 ) ).toBe( -1 );
			});

			// all digits must satisfy 0 <= d < input base
			it( 'negative digit', function(){
				expect( SUT.rebase( inputBase=2, digits=[1, -1, 1, 0, 1, 0], outputBase=10 ) ).toBe( -1 );
			});

			it( 'invalid positive digit', function(){
				expect( SUT.rebase( inputBase=2, digits=[1, 2, 1, 0, 1, 0], outputBase=10 ) ).toBe( -1 );
			});

			it( 'output base is one', function(){
				expect( SUT.rebase( inputBase=2, digits=[1, 0, 1, 0, 1, 0], outputBase=1 ) ).toBe( -1 );
			});

			it( 'output base is zero', function(){
				expect( SUT.rebase( inputBase=10, digits=[7], outputBase=0 ) ).toBe( -1 );
			});

			it( 'output base is negative', function(){
				expect( SUT.rebase( inputBase=2, digits=[1], outputBase=-7 ) ).toBe( -1 );
			});

			it( 'both bases are negative', function(){
				expect( SUT.rebase( inputBase=-2, digits=[1], outputBase=-7 ) ).toBe( -1 );
			});

		});
	}
}
