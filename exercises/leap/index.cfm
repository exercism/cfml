<cfsetting showDebugOutput="false">
<cfparam name="url.reporter" 		default="simple">
<cfscript>
	// get a list of all CFCs in this folder whose name looks like "XXXTest.cfc"
	// And turn it into compnent path relative to the web root
	url.bundles = directoryList(
			path='/leap',
			filter='*test.cfc' )
		.map( function( path ) {
			return path
					.replaceNoCase( expandPath( '/' ), '' )
					.left( -4 )
		} )
		.toList();
</cfscript>

<!--- Ensure TestBox --->
<cfif fileExists( "/testbox/system/runners/HTMLRunner.cfm" )>
	<!--- Include the TestBox HTML Runner --->
	<cfinclude template="/testbox/system/runners/HTMLRunner.cfm">
<cfelse>
	Oops, you don't have TestBox installed yet! Please run <b>box install</b> from the root of your excercise folder and refresh this page.	
</cfif>
