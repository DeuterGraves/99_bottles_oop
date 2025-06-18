# Notes from Reading

## "Before" Reading - My Reflections
### General reflections:
Looking at my code here, it leaps out that `count` gets passed around a LOT. Could I make this an instance variable? so it's just "available" instead of constantly passed around, though technically, I guess it's more secure to constantly pass it around, and it may make the verse method a little more readable.

This probably should be split into more than one class - Bottles, Verse, Song... maybe verses - but that feels sufficiently related to verse that splitting those too may be a step tooooooo far.

The methods in the test hint that multiple classes may not be the way to go here anyways.

### My solution and Domain Questions:
1. How many verse variants are there?
Honestly, looking over my code, this is hard to say - I'd go with 3 or 4 if I had to hazard a guess.

2. Which verses are most alike? In what way?

Since it's so hard to tell how many variants there are, it's harder to say how many are the same without leaning on the domain knowledge everyone gains in grade school, ah yes, 99 bottles of beer, while people may handle the last verse a little differently... it's a given that verses 99-2ish are the same... etc.etc.etc.

3. Which Verses are most different? In what way?

Equally hard to guess from the code, again, we'd be leaning on grade school knowledge here, which is ok, but probably best to try toclarify a bit better since in the case of this song- it may vary from country to country, state to state and even down to the city level, bigger questions, legal ones, we definitely wouldn't want to rely on the engineer to "just know".

### Considerations for my refactor (based on reading)
1. Template the verses. But don't implement the templates as they did in listing 1.2 with lambdas. That did seem unnecessarily fancy. Very much "everything's a nail and this guy just learned about lambdas"

4. What is the rule to determine which verse should be sung next?

This bit is clear from my code - the count determines all.

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
