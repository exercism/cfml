<!--- 

This file will only be used if you want to start up a web server in this directory.  You can do so by running:

$> box
CommandBox> install
CommandBox> server start

However, this is not necessary unless you really just want to use the HTML reporters on TestBox.  
Ideally, you'll skip the need for this file entirely and just run the tests directly frm the CLI like this:

CommandBox> task run TestRunner

 --->
<cfsetting showDebugOutput="false">
<cfparam name="url.reporter" 		default="simple">
<cfscript>
	// get a list of all CFCs in this folder whose name looks like "XXXTest.cfc"
	// And turn it into compnent path relative to the web root
	url.bundles = directoryList(
			path=expandPath( '/' ),
			filter='*Test.cfc' )
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
