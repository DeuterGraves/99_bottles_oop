## Chapter 2:

### 2.2: Writing the First Test

>Despite its apparent import, the choice you make here hardly matters
[regarding: the choice of what to test first.]

* consider the problem
* sketch out an overall plan
* pick a starting place and get going

In writing the test, they considered the API that might be created and felt it might have:
* verse(n) return lyrics for verse with bottle count `n`
* verses(a, b) return lyrics for verses a*b
* song return lyrics for the whole song.

**HOT TIP**
Ruby programmers by convention use `_` to "name" an unused argument. It will let you create a method that takes an argument without determining what that argument should be so that you can proceed in TDD and get a new test failure to move forward with.

### 2.4: Tolerating Duplication

>As tests get more specific, code should become more generic"

* code becomes more generic by becoming more abstract.
* DRYing out code can make it more abstract

Pluralization is a red herring - it seems important, because you have incomplete information

count how many times the word "bottle" (incl "bottles") occurs - the fact that it appears so often signals there's an underlying concept that's not yet been unearthed.

- making once instance of "bottle" abstract (so that it can toggle pluralization) makes it harder to see how all the instances of it are similiar.

Questions to ask when modifying/DRYing out code:
* Does the change I'm contemplating make the code harder to understand?
Be suspicious of any change that muddies the water * this suggests an insufficient understanding of the problem
* What is the future cost of doing nothing now?
Some changes cost the same if they're made now or later - if it doesn't impact the cost - delay making the change - waiting saves you money
* When will the future arrive, or how soon will I get more information?
It's better to tolerate duplication than to anticipate the wrong abstraction.

>Subsequent tests, or future requirements, will provide the exact information necessary to improve the code.|

(Stark conditional is a version that creates 2 verse blocks - one for the 2 bottles verse and a second for 99-3 - with an if/else deciding which to run)

Stark conditional is deemed the better of the two because it doesn't abstract anything yet.

What's interesting is - do you really know that you don't know everything you need to know about the problem even at this point? I guess the idea is - get all the tests passing first, then clean up the code.

### 2.5: Hewing to the Plan

>Shameless Green is optimised to be straightforward and intention-reavealing - it doesn't much concern itself with changeability

**Before committing to abstractions:**
* maximise your understanding of the problem
* unearth _all_ available infomration

**if/elsif vs case**
* if/elsif implies that each condition varies in a meaninful way often used to test wildly different conditions
* case implies that every condition checks for equality against an explicit value - readers expect conditions to be fundamentally the same.

When I read these examples, for me, if statements feel like balls flowing through a panchinko machine - we have the `if` and `elsif` - we know what marbles are coming and where they'll go and the `else` which should catch all the others - just the same as a case statement, as I read it, I feel like the writer didn't know what to expect and somethings might get past the code - I'm _looking_ for things that might slip through the cracks, when I read a case statement, I don't have that "danger" feeling - this is founded in nothing, and really, in either code path, we have an `else` which will protect us from anything falling through the cracks.

This is probably related to the "wildly different conditions" use typically seen with `if`/`elsif` statements.

### 2.6: Exposing Responsibilities

The danger for me in Listing 2.17 is the whole - what if there' a typo in verses, and it's in the test too and it's all passing, it's just all wrong from top to bottom.

>The problem with the verses implementation (2.17) is that it does not isolate a new, independent example, but instead, it duplicates one that you've already identified.


This duplicate (all duplications here have only minor variations)
* provides no new information.
* masks the true responsibility of `verses`\

This quote about the responsibility of `verses` is beautifully broad and possibly applies to all methods:


>The verses method is responsible for understanding its input arguments, and for knowing how to use these arguments to produce the correct output.


Responsibilies:
`verse`: the verse templates
`verses`: request the lyrics for multiples verses from `verse` and collect the output into a string

Fake It style TDD feels almost like pseudocode - it's pseudocode that passes tests though.

**TODO:** Go back and make some notes for the Removing Duplication section. (2.3)

### 2.7 Choosing names (aka: naming things is hard)

Do we need the `song` method?

_Knowlege that one object has about another creates a dependency_

Dependencies
* tie objects together - making change more costly

Goals:
* message sender: incur a limited number of dependencies
* method provider: inflict few

To request the song lyrics
* `song` imposes 1 dependency: you need to know it's name
* `verses` requires you know:
  * method name (`verses`)
  * how many arguments required (2)
  * first argument is the starting point and must be higher
  * second argument is the last verse and must be lower than the first
  * that the song starts on verse 99
  * the song ends on verse 0

This means there are many ways the `verses` method could break for senders of the method.

 ### 2.8 Revealing Intentions

 * intention - understanding a computation in essence
 * implementation - understanding a computation in detail

`song` is the intention (always the entire song)
`verses(99,0)` is the implementation (lyrics for a range of verses)

Senders of `song` want all lyrics and shouldn't have to worry about the details (`verses(max, min)`)

### 2.9 Writing Cost-Effective Tests

If tests are tied too closely to the code, any change to the code will break the tests.

Tests should confirm what your code does, without any knowledge of how.

### 2.10 Avoiding the Echo-chamber

How to test 100 nearly identical verses?!

Proposal 1:
```Ruby
def test_the_whole_song
  bottles = Bottles.new
  assert_equal bottles.verses(99, 0), bottles.song
end
```

I say: asserting against `bottles.verses(99,0)` actually just checks that `song` calls that code, it doesn't check that the output of either `song`, or `verses`, is correct.

Book also points out: the `song` test is coupled to the `Bottles` implementation so that it will break if the signature or behavior of `verses` changes _even if_ `song` still outputs the correct lyrics.

So, if we change the spelling of `verses` or add a parameter to that method... the test breaks, even though the output of both `verses` and `song` may not change

This means your test is too tightly coupled to your code.

I'm not going to bother with the code along, but it shows that you can completely break the song too, and it'll still pass. The code example would basically output:

99 bottles of beer on the wall...
...98 bottles of beer on the wall
98 bottles of beer on the wall...
...97 bottles of beer on the wall
ok
ok
ok
ok
ok
...
ok
2 bottles of beer on the wall...
...1 bottle of beer on the wall
1 bottle of beer on the wall...
...no more bottles of beer on the wall
no more bottles of beer on the wall...
...99 bottles of beer on the wall

with 95 verses replaced with just "ok" because the code, and the test are both calling the same `verses` method - it'll pass, it's not correct, but it'll pass.

listing 2.28 creates the same problems really, it just bypasses calling `verses(max, min)` to get those same problems.

painful as it is, the best way to do this is to just have all the lyrics in the test.

### 2.11 Considering Options

Alternatives to writing out the whole dang song:
1. assert that output matches another method
  * the first two variants used methods in our `Bottles` class to do this and ended up too tightly coupled to the code
  * that creates a dependency - changes to the code, may break the test without changing the output of the code.
2. Assert the expected output matches a dynamically generated string
  * this would still require the use of logic to create the string, and risks a scenario where a code change breaks the test in a confusing way.
3. Assert the expected output matches a hard coded string (aka the whole dang song)
  * clear expectation
  * no dependencies
  * "lots of work"

DRYing out lyics would introduce an abstraction.
Abstractions don't belong in tests.

### 2.12 Summary

When done well Testing:
* speeds development
* lowers costs
* prevents costly guesses (if you commit to writing code in small steps)
* make it safe to refactor (when decoupled from code)

Good tests
* tell a story
* lead to well organised solution

/chapter2