# Pangram

Determine if a sentence is a pangram. A pangram (Greek: παν γράμμα, pan gramma,
"every letter") is a sentence using every letter of the alphabet at least once.
The best known English pangram is:
> The quick brown fox jumps over the lazy dog.

The alphabet used consists of ASCII letters `a` to `z`, inclusive, and is case
insensitive. Input will not contain non-ASCII symbols.

* * * *

To run the code in this exercise, you will only need to have [CommandBox CLI installed](https://commandbox.ortusbooks.com/setup/installation).  This binary runs CFML code from the command line.

To run the tests, `cd` into the exercise folder and run the following:

```bash 
box task run TestRunner
# Or start up a test watcher that will rerun when files change
box task run TestRunner --:watcher
```

The tests leverage a library called TestBox which supports xUnit and BDD style of testing.  All test suites will be written in the [BDD style](https://testbox.ortusbooks.com/content/primers/bdd/specs.html) which uses closures to define test specs.  You won't need to worry about installing TestBox.  The CLI test runner will take care of that for you.  You just need to be connected to the internet the first time you run it.  You can read more about it here:

[https://testbox.ortusbooks.com/content/](https://testbox.ortusbooks.com/content/)

## Source

Wikipedia [https://en.wikipedia.org/wiki/Pangram](https://en.wikipedia.org/wiki/Pangram)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
