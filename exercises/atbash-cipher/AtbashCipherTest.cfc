component extends="testbox.system.BaseSpec" {

	function beforeAll(){
	  SUT = createObject( 'AtbashCipher' );
	}

	function run(){
	
		describe( "My AtbashCipher class", function(){			

			describe( 'encode', function(){

				it( 'encode yes', function(){
					expect( SUT.encode( phrase='yes' ) ).toBe( 'bvh' );
				});

				it( 'encode no', function(){
					expect( SUT.encode( phrase='no' ) ).toBe( 'ml' );
				});

				it( 'encode OMG', function(){
					expect( SUT.encode( phrase='OMG' ) ).toBe( 'lnt' );
				});

				it( 'encode spaces', function(){
					expect( SUT.encode( phrase='O M G' ) ).toBe( 'lnt' );
				});

				it( 'encode mindblowingly', function(){
					expect( SUT.encode( phrase='mindblowingly' ) ).toBe( 'nrmwy oldrm tob' );
				});

				it( 'encode numbers', function(){
					expect( SUT.encode( phrase='Testing, 1 2 3,  testing.' ) ).toBe( 'gvhgr mt123 gvhgr mt' );
				});

				it( 'encode deep thought', function(){
					expect( SUT.encode( phrase='Truth is fiction.' ) ).toBe( 'gifgs rhurx grlm' );
				});

				it( 'encode all the letters', function(){
					expect( SUT.encode( phrase='The quick brown fox jumps over the lazy dog.' ) ).toBe( 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' );
				});

			});

			describe( 'decode', function(){

				it( 'decode exercism', function(){
					expect( SUT.decode( phrase='vcvix rhn' ) ).toBe( 'exercism' );
				});

				it( 'decode a sentence', function(){
					expect( SUT.decode( phrase='zmlyh gzxov rhlug vmzhg vkkrm thglm v' ) ).toBe( 'anobstacleisoftenasteppingstone' );
				});

				it( 'decode numbers', function(){
					expect( SUT.decode( phrase='gvhgr mt123 gvhgr mt' ) ).toBe( 'testing123testing' );
				});

				it( 'decode all the letters', function(){
					expect( SUT.decode( phrase='gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt' ) ).toBe( 'thequickbrownfoxjumpsoverthelazydog' );
				});

			});

		});
		
	}
 
}