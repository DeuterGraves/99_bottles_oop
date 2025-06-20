# Notes from Reading

## "Before" Reading - My Reflections
### General reflections:
Looking at my code here, it leaps out that `count` gets passed around a LOT. Could I make this an instance variable? so it's just "available" instead of constantly passed around, though technically, I guess it's more secure to constantly pass it around, and it may make the verse method a little more readable.

This probably should be split into more than one class - Bottles, Verse, Song... maybe verses - but that feels sufficiently related to verse that splitting those too may be a step tooooooo far.

The methods in the test hint that multiple classes may not be the way to go here anyways.

## Reflections while reading

My `second_phrase` method is basically, the start of a template method. I wonder if on refactor I would've seen that.

My `bottle_plural_agreement` and `bottle_number` methods, should probably have been handled together with the `first_word` method - if not a straight template method with the set number of cases required for the song. having these 3 separate creates needless complexities, there are combinations of the outcomes of these methods that will never happen together - it gives us a lot of unnecessary codepaths.

### My solution and Domain Questions:
1. How many verse variants are there?
Honestly, looking over my code, this is hard to say - I'd go with 3 or 4 if I had to hazard a guess.

2. Which verses are most alike? In what way?

Since it's so hard to tell how many variants there are, it's harder to say how many are the same without leaning on the domain knowledge everyone gains in grade school, ah yes, 99 bottles of beer, while people may handle the last verse a little differently... it's a given that verses 99-2ish are the same... etc.etc.etc.

3. Which Verses are most different? In what way?

Equally hard to guess from the code, again, we'd be leaning on grade school knowledge here, which is ok, but probably best to try toclarify a bit better since in the case of this song- it may vary from country to country, state to state and even down to the city level, bigger questions, legal ones, we definitely wouldn't want to rely on the engineer to "just know".

4. What is the rule to determine which verse should be sung next?

This bit is clear from my code - the count determines all.

BUT - it's not like there's a clear cut one rule - we encounter this each time we get to a word or phrase really.

AND - I do miserably on "which verse should be sung next".

### Considerations for my refactor (based on reading)
1. Template the verses. But don't implement the templates as they did in listing 1.2 with lambdas. That did seem unnecessarily fancy. Very much "everything's a nail and this guy just learned about lambdas"

2. I've really got to review `.map` I used to use it all the dang time and nearly every solution here's used it - especially for the `\n` line breaks, but I remember having trouble with no line break needed on the last verse - infact that failed the test, so I'm curious how these solutions are avoiding that... they seem to have the `.join("\n")` at the end of the verse, which should pop that on the last verse too - unless, I need to double check the tests and read further into this 1.4 Shameless Green solution -- unless the last verse "go to the store and buy some more..." doesn't have the join and is created outside of this `verses` method.

3. Having just read the domain questions in `1.4: Shameless Green` I'm now thinking we need:
a. a method that outlines the verses in cases/if statements
b. a method with logic that decides which case to call



## Chapter 1:

### Listing 1.1: Incomprehensibly Concise

Evaluate the potential expense of code:
1. how difficult was it to write
2. how hard is it to understand
3. how expensive will it be to change

My solution, as edited:
1. how difficult was it to write
It took time to write, any difficulty was mostly due to being rusty - I mean who forgets that to output a string you have to actually build one? me, that's who. It was fun looking for methods to cover needs - I hagen't used ranges much and didn't even know .downto existed... I think I looked into a method `step` saw lots of options along the day, experimented with building an array of the number of bottles and then iterating through - that's what took the time, none of it particularly hard.

2. how hard is it to understand
I'd say it's on the easy end of the spectrum, looking back at it, there's some naming that could be improved `first_word` for example, doesn't quite capture it and doesn't tell the reader much about the actual output - yes, I know it's the `first_word` of whatever's about to happen but I don't know what the word is or might be... `second_phrase` - same story, how important is it for the reader to know, though, what it is we're outputting precisely.

3. How expensive will it be to change

I think it'll be pretty straightforward to change, the logic is all extracted out from the verse method, so when you're making a change, it's a slightly less daunting amount of text you're editing - you're looking to change a smaller chunk at a go.

### Listing 1.2: Speculatively General

Domain questions to consider (introduced in previous section but explored here)

1. How many verse variants are there?
2. Which verses are most alike? In what way?
3. Which Verses are most different? In what way?
4. What is the rule to determine which verse should be sung next?

### Listing 1.3: Concretely Abstract
I think this may be most like my code. WHAT DOES THIS SAY ABOUT ME?! I've been watiing for this moment. lol.

Excellent point made: while changing one of the smaller methods is easy, the change may ripple out and cause the need for many other small changes, which may not be readily apparent until the tests are run or the output is read. This should probably be a bit more apparent from reading the code rather than further down the line - unit testing or ppt.

"You should name methods not after what they do, but after what they mean, what they represent in the context of your domain" - so... aim for descriptive, not exact.

i.e. `def beverage` instead of `def beer`

Looking at my code, I think I've done a fairly good job of that.

*Name methods after the concept they represent rather than how they currently behave*

The book talks about the right abstractions, and I think in my code I did a better job here than Listing 1.3 - why did they have a method just for returning "beer"? that is not a part of the song that changes. My methods only deal with parts of the song that change based on the number of bottles present on the wall. so there's that. I'm not a total monkey... wait, was there a business case for potentially changing the drink down the line?

### Listing 1.4: Shameless Green

This is good. That is all. lol.

### 1.2.3 Comparing Solutions
https://github.com/seattlerb/flog flog sounds like an interesting code evaluation tool - based on ABC method - Assignments, Branches, and Conditionals.

## Chapter 2:

### 2.2: Writing the First Test

"Despite its apparent import, the choice you make here" [regarding: the choice of what to test first.]

- consider the problem
- sketch out an overall plan
- pick a starting place and get going

In writing the test, they considered the API that might be created and felt it might have:
- verse(n) return lyrics for verse with bottle count `n`
- verses(a, b) return lyrics for verses a-b
- song return lyrics for the whole song.

**HOT TIP**
- Ruby programmers by convention use `_` to "name" an unused argument. It will let you create a method that takes an argument without determining what that argument should be so that you can proceed in TDD and get a new test failure to move forward with.

### 2.4: Tolerating Duplication

"As tests get more specific, code should become more generic"

- code becomes more generic by becoming more abstract.
- DRYing out code can make it more abstract

Pluralization is a red herring - it seems important, because you have incomplete information

count how many times the word "bottle" (incl "bottles") occurs - the fact that it appears so often signals there's an underlying concept that's not yet been unearthed.

- making once instance of "bottle" abstract (so that it can toggle pluralization) makes it harder to see how all the instances of it are similiar.

Questions to ask when modifying/DRYing out code:
- Does the change I'm contemplating make the code harder to understand?
Be suspicious of any change that muddies the water - this suggests an insufficient understanding of the problem
- What is the future cost of doing nothing now?
Some changes cost the same if they're made now or later - if it doesn't impact the cost - delay making the change - waiting saves you money
- When will the future arrive, or how soon will I get more information?
It's better to tolerate duplication than to anticipate the wrong abstraction.

"Subsequent tests, or future requirements, will provide the exact information necessary to improve the code.|

(Stark conditional is a version that creates 2 verse blocks - one for the 2 bottles verse and a second for 99-3 - with an if/else deciding which to run)

Stark conditional is deemed the better of the two because it doesn't abstract anything yet.

What's interesting is - do you really know that you don't know everything you need to know about the problem even at this point? I guess the idea is - get all the tests passing first, then clean up the code.

### 2.5: Hewing to the Plan

"Shameless Green is optimised to be straightforward and intention-reavealing - it doesn't much concern itself with changeability

**Before committing to abstractions:**
- maximise your understanding of the problem
- unearth _all_ available infomration

**if/elsif vs case**
- if/elsif implies that each condition varies in a meaninful way often used to test wildly different conditions
- case implies that every condition checks for equality against an explicit value - readers expect conditions to be fundamentally the same.

When I read these examples, for me, if statements feel like balls flowing through a panchinko machine - we have the `if` and `elsif` - we know what marbles are coming and where they'll go and the `else` which should catch all the others - just the same as a case statement, as I read it, I feel like the writer didn't know what to expect and somethings might get past the code - I'm _looking_ for things that might slip through the cracks, when I read a case statement, I don't have that "danger" feeling - this is founded in nothing, and really, in either code path, we have an `else` which will protect us from anything falling through the cracks.

This is probably related to the "wildly different conditions" use typically seen with `if`/`elsif` statements.

### 2.6: Exposing Responsibilities

The danger for me in Listing 2.17 is the whole - what if there' a typo in verses, and it's in the test too and it's all passing, it's just all wrong from top to bottom.

"The problem with the verses implementation (2.17) is that it does not isolate a new, independent example, but instead, it duplicates one that you've already identified."

This duplicate (all duplications here have only minor variations)
- provides no new information.
- masks the true responsibility of `verses`\

This quote about the responsibility of `verses` is beautifully broad and possibly applies to all methods:

```
The verses method is responsible for understanding its input arguments, and for knowing how to use these arguments to produce the correct output.
```

Responsibilies:
`verse`: the verse templates
`verses`: request the lyrics for multiples verses from `verse` and collect the output into a string

Fake It style TDD feels almost like pseudocode - it's pseudocode that passes tests though.

TODO: Go back and make some notes for the Removing Duplication section. (2.3)
