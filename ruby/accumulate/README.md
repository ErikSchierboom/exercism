# Accumulate

Implement the `accumulate` operation, which, given a collection and an
operation to perform on each element of the collection, returns a new
collection containing the result of applying that operation to each element of
the input collection.

Given the collection of numbers:

- 1, 2, 3, 4, 5

And the operation:

- square a number (`x => x * x`)

Your code should be able to produce the collection of squares:

- 1, 4, 9, 16, 25

Check out the test suite to see the expected function signature.

## Restrictions

Keep your hands off that collect/map/fmap/whatchamacallit functionality
provided by your standard library!
Solve this one yourself using other basic tools instead.

## Advanced

It is typical to call [#to_enum](http://ruby-doc.org/core-2.3.1/Object.html#method-i-to_enum) when defining methods for a generic Enumerable, in case no block is passed.

Here is an additional test you could add:

```ruby
def test_accumulate_when_block_is_deferred
  skip
  accumulate_enumerator = [1, 2, 3].accumulate
  accumulated_result = accumulate_enumerator.map do |number|
    number * number
  end
  assert_equal [1, 4, 9], accumulated_result
end
```


* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby accumulate_test.rb

To include color from the command line:

    ruby -r minitest/pride accumulate_test.rb


## Source

Conversation with James Edward Gray II [https://twitter.com/jeg2](https://twitter.com/jeg2)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
