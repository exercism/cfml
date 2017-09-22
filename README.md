# Exercism ColdFusion Track

[![Build Status](https://travis-ci.org/exercism/coldfusion.svg?branch=master)](https://travis-ci.org/exercism/coldfusion)

Exercism problems in ColdFusion.  There are two major CFML engines in existence:

* **[Lucee Server](http://lucee.org/)** - A free open source CFML engine
* **[Adobe ColdFusion](http://www.adobe.com/products/coldfusion-family.html)** - A commercially supported Enterprise CF engine

These exercises should teach the basics of CFML in a way that can be transferred to either engine.  The CommandBox CLI will run your tests against Lucee Server by default.  

## Setup

The only thing you will need to run these exercises is [CommandBox CLI](https://ortus.gitbooks.io/commandbox-documentation/content/getting_started_guide.html) and [Java 7+](https://java.com/en/download/) installed.  CommandBox CLI is supported on Mac, Linux, and Windows, and the installation guide can be found here:

[https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html](https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html)

An example of getting CommandBox CLI setup if you're a Homebrew user on Mac would be:

```bash
brew install commandbox
```

## Anatomy of an Exercise

The files for an exercise live in `/exercises/<slug>`. The slug for an exercise is a unique nickname composed of a-z (lowercase) and -, e.g. `leap` or `hello-world`. Inside its directory, each exercise has:

* `<exercise_name>Test.cfc` - The test suite
* `<exercise_name>.cfc` - Implementation stub, omitted for the later exercises 
* `SolutionTest.cfc` - A test suite that runs the Solution
* `Solution.cfc` - An example solution
* `TestRunner.cfc` - A CLI task runner to run the unit test with
* `box.json` - A package descriptor that lists dependencies
* `index.cfm` - A web-based test runner for students wishing to start a web server  

## Running the Tests

To run the test for a given exercise, `cd` into the folder and run the following:

```bash 
box task run TestRunner
# Or start up a test watcher that will rerun when files change
box task run TestRunner --:watcher
```

If you want to run the test suite against the solution: 

```bash 
box task run TestRunner --:solution
```

The tests leverage a library called TestBox which supports xUnit and BDD style of testing.  All test suites will be written in the [BDD style](https://testbox.ortusbooks.com/content/primers/bdd/specs.html) which uses closures to define test specs.  You won't need to worry about installing TestBox.  The CLI test runner will take care of that for you.  You just need to be connected to the internet the first time you run it.  You can read more about it here:

[https://testbox.ortusbooks.com/content/](https://testbox.ortusbooks.com/content/)

## Pull Requests

We welcome pull requests that provide fixes to existing test suites (missing tests, interesting edge cases, improved APIs), as well as new problems.

If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

Please submit changes to a single problem per pull request unless you're submitting a general change across many of the problems (e.g. formatting).

## Style Guide
The exercise tests, solutions, and filenames will follow this ColdFusion style guide.

[ColdFusion (CFML) Standards & Best Practices](https://github.com/Ortus-Solutions/coding-standards/blob/master/coldfusion.md)


Here's the TL;DR; version.

* Component names are camel-cased ( `LeapTest.cfc` )
* Variable names are headless camel-cased ( `greetingService` )
* Variable names should avoid abbreviations and be descriptive ( `maximumAccountBalance` )
* Indentation uses a tab character
* Remove trailing whitespace from lines 
* Block statements will use the [`1TBS`](https://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS_.28OTBS.29) with space padding all parens and brackets as follows:
 
```js
if( condition || otherCondition ) {
	myStruct[ key ] = doSomething( param1, param2, true, 'Tuesday' );
} else {
	return false;
}
```

TODO: Configure task runner to lint exercises and clean trailing whitespace and tabs/spaces.  Allow this to be run on all exercises or a single one.


## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/docs/blob/master/contributing-to-language-tracks/README.md)
