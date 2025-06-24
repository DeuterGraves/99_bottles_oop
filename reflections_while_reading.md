# "Before" Reading - My Reflections
## General reflections:
Looking at my code here, it leaps out that `count` gets passed around a LOT. Could I make this an instance variable? so it's just "available" instead of constantly passed around, though technically, I guess it's more secure to constantly pass it around, and it may make the verse method a little more readable.

This probably should be split into more than one class - Bottles, Verse, Song... maybe verses - but that feels sufficiently related to verse that splitting those too may be a step tooooooo far.

The methods in the test hint that multiple classes may not be the way to go here anyways.

# Reflections while reading

My `second_phrase` method is basically, the start of a template method. I wonder if on refactor I would've seen that.

My `bottle_plural_agreement` and `bottle_number` methods, should probably have been handled together with the `first_word` method - if not a straight template method with the set number of cases required for the song. having these 3 separate creates needless complexities, there are combinations of the outcomes of these methods that will never happen together - it gives us a lot of unnecessary codepaths.

At the end of part 2.8, I see my code is in the reverse order of Sandi's - there's only convention and style I guess dictating this. Mine's simply written in the order that the work was done: `verse`, `verses`, and then `song`. There's a friendliness to the reader in doing it in the opposite direction, starting with `song` - it eases them in to what's happening before the big block of text, but also, as a reader, it forces you to read on to understand what `song` is using and in turn what `verses` uses to build `song`.

## My solution and Domain Questions:
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

## Considerations for my refactor (based on reading)
1. Template the verses. But don't implement the templates as they did in listing 1.2 with lambdas. That did seem unnecessarily fancy. Very much "everything's a nail and this guy just learned about lambdas"

2. I've really got to review `.map` I used to use it all the dang time and nearly every solution here's used it - especially for the `\n` line breaks, but I remember having trouble with no line break needed on the last verse - infact that failed the test, so I'm curious how these solutions are avoiding that... they seem to have the `.join("\n")` at the end of the verse, which should pop that on the last verse too - unless, I need to double check the tests and read further into this 1.4 Shameless Green solution -- unless the last verse "go to the store and buy some more..." doesn't have the join and is created outside of this `verses` method.

3. Having just read the domain questions in `1.4: Shameless Green` I'm now thinking we need:
a. a method that outlines the verses in cases/if statements
b. a method with logic that decides which case to call