## Notes from Reading

# Chapter 1:
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

