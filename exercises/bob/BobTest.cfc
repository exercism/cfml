component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'Bob' );
	}

	function run(){
	
		describe( "My Bob class", function(){			

			it( 'stating something', function(){
				expect( SUT.response( heyBob='Tom-ay-to,  tom-aaaah-to.' ) ).toBe( 'Whatever.' );
			});

			it( 'shouting', function(){
				expect( SUT.response( heyBob='WATCH OUT!' ) ).toBe( 'Whoa, chill out!' );
			});

			it( 'shouting gibberish', function(){
				expect( SUT.response( heyBob='FCECDFCAAB' ) ).toBe( 'Whoa, chill out!' );
			});

			it( 'asking a question', function(){
				expect( SUT.response( heyBob='Does this cryogenic chamber make me look fat?' ) ).toBe( 'Sure.' );
			});

			it( 'asking a numeric question', function(){
				expect( SUT.response( heyBob='You are,  what,  like 15?' ) ).toBe( 'Sure.' );
			});

			it( 'asking gibberish', function(){
				expect( SUT.response( heyBob='fffbbcbeab?' ) ).toBe( 'Sure.' );
			});

			it( 'talking forcefully', function(){
				expect( SUT.response( heyBob='Let''s go make out behind the gym!' ) ).toBe( 'Whatever.' );
			});

			it( 'using acronyms in regular speech', function(){
				expect( SUT.response( heyBob='It''s OK if you don''t want to go to the DMV.' ) ).toBe( 'Whatever.' );
			});

			it( 'forceful question', function(){
				expect( SUT.response( heyBob='WHAT THE HELL WERE YOU THINKING?' ) ).toBe( 'Calm down, I know what I''m doing!' );
			});

			it( 'shouting numbers', function(){
				expect( SUT.response( heyBob='1,  2,  3 GO!' ) ).toBe( 'Whoa, chill out!' );
			});

			it( 'only numbers', function(){
				expect( SUT.response( heyBob='1,  2,  3' ) ).toBe( 'Whatever.' );
			});

			it( 'question with only numbers', function(){
				expect( SUT.response( heyBob='4?' ) ).toBe( 'Sure.' );
			});

			it( 'shouting with special characters', function(){
				expect( SUT.response( heyBob='ZOMG THE %^*@##$(*^ ZOMBIES ARE COMING!!11!!1!' ) ).toBe( 'Whoa, chill out!' );
			});

			it( 'shouting with no exclamation mark', function(){
				expect( SUT.response( heyBob='I HATE YOU' ) ).toBe( 'Whoa, chill out!' );
			});

			it( 'statement containing question mark', function(){
				expect( SUT.response( heyBob='Ending with ? means a question.' ) ).toBe( 'Whatever.' );
			});

			it( 'non-letters with question', function(){
				expect( SUT.response( heyBob=':) ?' ) ).toBe( 'Sure.' );
			});

			it( 'prattling on', function(){
				expect( SUT.response( heyBob='Wait! Hang on. Are you going to be OK?' ) ).toBe( 'Sure.' );
			});

			it( 'silence', function(){
				expect( SUT.response( heyBob='' ) ).toBe( 'Fine. Be that way!' );
			});

			it( 'prolonged silence', function(){
				expect( SUT.response( heyBob='          ' ) ).toBe( 'Fine. Be that way!' );
			});

			it( 'alternate silence', function(){
				expect( SUT.response( heyBob='										' ) ).toBe( 'Fine. Be that way!' );
			});

			it( 'multiple line question', function(){
				expect( SUT.response( heyBob='#chr( 10 )#Does this cryogenic chamber make me look fat?#chr( 10 )#no' ) ).toBe( 'Whatever.' );
			});

			it( 'starting with whitespace', function(){
				expect( SUT.response( heyBob='         hmmmmmmm...' ) ).toBe( 'Whatever.' );
			});

			it( 'ending with whitespace', function(){
				expect( SUT.response( heyBob='Okay if like my  spacebar  quite a bit?   ' ) ).toBe( 'Sure.' );
			});

			it( 'other whitespace', function(){
				expect( SUT.response( heyBob='#chr( 10 )##chr( 13 )# 	' ) ).toBe( 'Fine. Be that way!' );
			});

			it( 'non-question ending with whitespace', function(){
				expect( SUT.response( heyBob='This is a statement ending with whitespace      ' ) ).toBe( 'Whatever.' );
			});

		});
		
	}
 
}