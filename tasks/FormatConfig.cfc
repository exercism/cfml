/**
* This is a simple task runner that formats the JSON config file.  This should only be neccessary if yoiu've edited it by 
* hand and want to get it back into the proper format as far as spacing and indentation goes.  This follows the same format as `configlet fmt`
*/
component {
	
	function run() {
		// Determine the root of the repo based on the location of this task runner
		var repoRootPath = expandPath( getDirectoryFromPath( getCurrentTemplatePath() ) & '../' );
		// Read in the current JSON config file
		var configJSONRaw = fileRead( repoRootPath & '/config.json' );
		var configJSON = deserializeJSON( configJSONRaw );
		
		var newConfigJSONRaw = formatterUtil.formatJSON( json=configJSON, indent='  ' , lineEnding=chr( 10 ), spaceAfterColon=true );
		
		if( newConfigJSONRaw != configJSONRaw ) {
			// Write it back out with the proper formatting styles applied
			fileWrite( repoRootPath & '/config.json', newConfigJSONRaw );
		
			print.greenLine( 'Config file [#repoRootPath#config.json] formatted!' );
		} else {
			print.whiteLine( 'Config file [#repoRootPath#config.json] is already formatted!' );
		}
	}
	
}