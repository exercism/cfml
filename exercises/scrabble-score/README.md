# Scrabble Score

Given a word, compute the scrabble score for that word.

## Letter Values

You'll need these:

```text
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
```

## Examples

"cabbage" should be scored as worth 14 points:

- 3 points for C
- 1 point for A, twice
- 3 points for B, twice
- 2 points for G
- 1 point for E

And to total:

- `3 + 2*1 + 2*3 + 2 + 1`
- = `3 + 2 + 6 + 3`
- = `5 + 9`
- = 14

## Extensions

- You can play a double or a triple letter.
- You can play a double or a triple word.

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

Inspired by the Extreme Startup game [https://github.com/rchatley/extreme_startup](https://github.com/rchatley/extreme_startup)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
