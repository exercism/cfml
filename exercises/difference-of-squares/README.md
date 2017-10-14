# Difference Of Squares

Find the difference between the square of the sum and the sum of the squares of the first N natural numbers.

The square of the sum of the first ten natural numbers is
(1 + 2 + ... + 10)² = 55² = 3025.

The sum of the squares of the first ten natural numbers is
1² + 2² + ... + 10² = 385.

Hence the difference between the square of the sum of the first
ten natural numbers and the sum of the squares of the first ten
natural numbers is 3025 - 385 = 2640.

* * * *

To run the code in this exercise, you will only need to have [CommandBox CLI installed](https://ortus.gitbooks.io/commandbox-documentation/content/setup/installation.html).  This binary runs CFML code from the command line.

To run the tests, `cd` into the exercise folder and run the following:

```bash 
box task run TestRunner
# Or start up a test watcher that will rerun when files change
box task run TestRunner --:watcher
```

The tests leverage a library called TestBox which supports xUnit and BDD style of testing.  All test suites will be written in the [BDD style](https://testbox.ortusbooks.com/content/primers/bdd/specs.html) which uses closures to define test specs.  You won't need to worry about installing TestBox.  The CLI test runner will take care of that for you.  You just need to be connected to the internet the first time you run it.  You can read more about it here:

[https://testbox.ortusbooks.com/content/](https://testbox.ortusbooks.com/content/)
## Source

Problem 6 at Project Euler [http://projecteuler.net/problem=6](http://projecteuler.net/problem=6)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
