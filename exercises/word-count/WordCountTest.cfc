component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'WordCount' );
	}

	function run(){
	
		describe( "My WordCount class", function(){			

			it( 'count one word', function(){
				expect( SUT.countWords( sentence='word' ) ).toBe( {"word":1} );
			});

			it( 'count one of each word', function(){
				expect( SUT.countWords( sentence='one of each' ) ).toBe( {"one":1,"of":1,"each":1} );
			});

			it( 'multiple occurrences of a word', function(){
				expect( SUT.countWords( sentence='one fish two fish red fish blue fish' ) ).toBe( {"one":1,"fish":4,"two":1,"red":1,"blue":1} );
			});

			it( 'handles cramped lists', function(){
				expect( SUT.countWords( sentence='one, two, three' ) ).toBe( {"one":1,"two":1,"three":1} );
			});

			it( 'handles expanded lists', function(){
				expect( SUT.countWords( sentence='one, #chr( 10 )#two, #chr( 10 )#three' ) ).toBe( {"one":1,"two":1,"three":1} );
			});

			it( 'ignore punctuation', function(){
				expect( SUT.countWords( sentence='car: carpet as java: javascript!!&@$%^&' ) ).toBe( {"car":1,"carpet":1,"as":1,"java":1,"javascript":1} );
			});

			it( 'include numbers', function(){
				expect( SUT.countWords( sentence='testing,  1,  2 testing' ) ).toBe( {"testing":2,"1":1,"2":1} );
			});

			it( 'normalize case', function(){
				expect( SUT.countWords( sentence='go Go GO Stop stop' ) ).toBe( {"go":3,"stop":2} );
			});

			it( 'with apostrophes', function(){
				expect( SUT.countWords( sentence='First: don''t laugh. Then: don''t cry.' ) ).toBe( {"first":1,"don't":2,"laugh":1,"then":1,"cry":1} );
			});

			it( 'with quotations', function(){
				expect( SUT.countWords( sentence='Joe can''t tell between ''large'' and large.' ) ).toBe( {"joe":1,"can't":1,"tell":1,"between":1,"large":2,"and":1} );
			});

			it( 'multiple spaces not detected as a word', function(){
				expect( SUT.countWords( sentence=' multiple   whitespaces' ) ).toBe( {"multiple":1,"whitespaces":1} );
			});

		});
		
	}
 
}