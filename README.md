# Exercism ColdFusion Track

[![Build Status](https://travis-ci.org/exercism/coldfusion.svg?branch=master)](https://travis-ci.org/exercism/coldfusion)

Exercism problems in ColdFusion.  There are two major CFML engines in existence:

* **Lucee Server** - A free open source CFML engine
* **Adobe ColdFusion** - A commercially supported Enterprise CF engine

These exercises should teach the basics of CFML in a way that can be transferred to either engine.  The CommandBox CLI will run your tests against Lucee Server by default.  

## Setup

The only thing you will need to run these exercises is CommandBox CLI and Java 7+ installed.  CommandBox CLI is supported on Mac, Linux, and Windows, and the installation guide can be found here:

[https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html](https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html)

An example of getting CommandBox CLI setup if you're a Homebrew user on Mac would be:


```bash
brew install commandbox
```

## Anatomy of an Exercise

The files for an exercise live in `/exercises/<slug>`. The slug for an exercise is a unique nickname composed of a-z (lowercase) and -, e.g. `leap` or `hello-world`. Inside its directory, each exercise has:

* A test suite, `<exercise_name>Test.cfc`
* An example solution, `Solution.cfc`
* A CLI task runner to run the unit test with, `TestRunner.cfc`

## Running the Tests

To run the test for a given exercise, `cd` into the folder and run the following:

```bash 
box task run TestRunner
# Or start up a test watcher that will rerun when files change
box task run TestRunner --watcher
```

If you want to run the test suite against the solution: 

```bash 
box task run TestRunner --solution
```

## Pull Requests

We welcome pull requests that provide fixes to existing test suites (missing tests, interesting edge cases, improved APIs), as well as new problems.

If you're unsure, then go ahead and open a GitHub issue, and we'll discuss the change.

Please submit changes to a single problem per pull request unless you're submitting a general change across many of the problems (e.g. formatting).

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)


