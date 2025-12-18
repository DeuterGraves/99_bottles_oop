# Notes from Reading

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

>You should name methods not after what they do, but after what they mean, what they represent in the context of your domain
so... aim for descriptive, not exact.

i.e. `def beverage` instead of `def beer`

Looking at my code, I think I've done a fairly good job of that.

>*Name methods after the concept they represent rather than how they currently behave*

The book talks about the right abstractions, and I think in my code I did a better job here than Listing 1.3 - why did they have a method just for returning "beer"? that is not a part of the song that changes. My methods only deal with parts of the song that change based on the number of bottles present on the wall. so there's that. I'm not a total monkey... wait, was there a business case for potentially changing the drink down the line?

### Listing 1.4: Shameless Green

This is good. That is all. lol.

### 1.2.3 Comparing Solutions
https://github.com/seattlerb/flog flog sounds like an interesting code evaluation tool - based on ABC method - Assignments, Branches, and Conditionals.

/chapter1
[ReadMe](../README.md)
