component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'WordCount' );
	}

	function run(){
	
		describe( "My WordCount class", function(){			

			it( 'count one word', function(){
				expect( SUT.countwords( input='word' ) ).toBe( {"word":1} );
			});

			it( 'count one of each word', function(){
				expect( SUT.countwords( input='one of each' ) ).toBe( {"one":1,"of":1,"each":1} );
			});

			it( 'multiple occurrences of a word', function(){
				expect( SUT.countwords( input='one fish two fish red fish blue fish' ) ).toBe( {"one":1,"fish":4,"two":1,"red":1,"blue":1} );
			});

			it( 'handles cramped lists', function(){
				expect( SUT.countwords( input='one, two, three' ) ).toBe( {"one":1,"two":1,"three":1} );
			});

			it( 'handles expanded lists', function(){
				expect( SUT.countwords( input='one, #chr( 10 )#two, #chr( 10 )#three' ) ).toBe( {"one":1,"two":1,"three":1} );
			});

			it( 'ignore punctuation', function(){
				expect( SUT.countwords( input='car: carpet as java: javascript!!&@$%^&' ) ).toBe( {"car":1,"carpet":1,"as":1,"java":1,"javascript":1} );
			});

			it( 'include numbers', function(){
				expect( SUT.countwords( input='testing,  1,  2 testing' ) ).toBe( {"testing":2,"1":1,"2":1} );
			});

			it( 'normalize case', function(){
				expect( SUT.countwords( input='go Go GO Stop stop' ) ).toBe( {"go":3,"stop":2} );
			});

			it( 'with apostrophes', function(){
				expect( SUT.countwords( input='First: don''t laugh. Then: don''t cry.' ) ).toBe( {"first":1,"don't":2,"laugh":1,"then":1,"cry":1} );
			});

			it( 'with quotations', function(){
				expect( SUT.countwords( input='Joe can''t tell between ''large'' and large.' ) ).toBe( {"joe":1,"can't":1,"tell":1,"between":1,"large":2,"and":1} );
			});

		});
		
	}
 
}