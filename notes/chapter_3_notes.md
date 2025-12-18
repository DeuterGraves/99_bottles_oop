# 3: Unearthing Concepts

## 3.1 Listening to Change

>Most cost-effective code is as good as necessary - no better

chosing to refactor now rather than later may cost opportunities (working on other problems)

new requirements tell you:
* exactly how the code should change - no need to speculate about the future
* imposes higher standards on affected code - code that needs to be change must be changeable

### 99 Bottles New Requirement!!!

* feature request: output "1 six-pack" any time it currently says "6 bottles"
  * **NB:** this is specific to "1 six-pack"
  * not multiples of six packs
  * "1 six-pack"
  * do not read further into requirements or try to predict the future.

Clarify requirements

Write the minimum necessary code (this actually leaves your code more flexible for the future than trying to make it flexible before you know how it needs to flex)

>Conditionals are the bane of OO

### Listing 3.2: Compounding Contidional Sins

We started with 4 branches, now we have 6.

>Conditionals breed, and now that this one has started reproducing, you must do something to stop it.

## 3.2: Starting with the Open/Closed Principle

We're into the SOLID principles!

Open/Closed: "open for extension and closed for modification"

Code is open to new requirements when you can meet the requirement without changing the code.

(refresher!)
#### SOLID:
**Single Responsibility**<br>
methods in a class should be cohesive around a single purpose<br>
**Open - Closed**<br>
Objects should be open for extension, but closed for modification<br>
**Liskov Substitution**<br>
Subclasses should be substitutable for their superclasses.<br>
**Interface Segregation**<br>
Objects should not be forced to depend on methods they don't use.<br>
**Dependency Inversion**<br>
Depend on abstractions, not on concretions.

### Open-Closed principle
You should not conflate the process of moving code around, of refactoring, with the act of adding new features

Separate adding new features from "cleaning up code"

When you get a new requirement:
1. rearrange/refactor existing code so it's open to the new feature
2. add the new code

adding the "six-pack" requirement required editing the conditional SO Shameless Green is not _open_ to this new feature.

(see open/closed flowchart)

1. is code open to new requirement?<br>
  a. yes: write the new bit of code<br>
  b. no: do you know how to alter the code to make it open to the new requirement?<br>
      i. yes: make alteration then return to **1**<br>
      ii. no: look for code smells, isolate these flaws, correct one, return to **1** repeat until the answer to **1** is *a* and you can move forward with new code.<br>

## 3.3 Recognising Code Smells

To successfully improve code within/as preparation for a smaller piece of work is to isolate and correct them one at a time.

Refactoring book sited:
[Refactoring: Improving the Design of Existing Code](https://martinfowler.com/books/refactoring.html)
- names many common flaws
- gives "recipes" to fix them

This book is where we got the name "code smells" 

Jay Fields has done a [Ruby version](https://martinfowler.com/books/refactoringRubyEd.html) of the book.

Code Smells mentioned (w/ solution):
- Duplicated code* (abstract away duplication)
- Large class (divide class into several)
- Divergent change
- Feature envy
- Primitive obsession
- Inappropriate intimacy
- Shotgun surgery
- Switch statement*

* smells actually found in the 99 bottles book/exercise

To look for code smells, start with what you don't like in the code. 

## 3.4 Identifying the best point of attack
(looking at cg_bottles.rb - which appears to be the shameless green version)

```ruby
  def verse(count)
    case count
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\nTake one down and pass it around, #{count-1} bottles of beer on the wall.\n"
    end
  end
```

case statement - "Switch statements" smell
- branches in this case statement contain Duplicated code (also a smell)

Duplicated code is the most straightforward and so addressed first. 

we don't know that removing the duplication will magically make this class more open to the six pack feature but it is _likely_ a step along the way.

## 3.5 Refactoring systematically

As defined by Martin Fowler in his book:
"Refactoring is the process of changing a software system in such a way that it does not alter the external behaviour of the code yet improves internal structure"

2 steps to implementing new requirements:
- rearrange existing code so it is open to new requirement
- write the code to meet new requirement

Refactoring should be done alongside testing to ensure that:
- you don't break the existing code
- you can discover potential flaws in the tests

tests that make assertions about _how_ things are done rather than test expected outcomes are most likely to break during refactoring. 

If the tests are a problem, you now have a new step in the process:

~2~3 steps to implementing new requirements:
- improve the tests
- rearrange existing code so it is open to new requirement
- write the code to meet new requirement


## 3.6 following the flocking rules... 

on the name - based on "flock" as in group of birds (except crows)
- a flock's behaviour can give the impression of being centrally coordinated BUT it's individual birds
- group's behaviour is the result of series of small decisions made by each individual 
- these decisions are guided by these rules:
1. Alignment - steer towards average heading of neighbors
2. separation - don't get too close to neighbors
3. cohesion steer towards average position of the flock

[Science of Sync](https://www.ted.com/talks/steven_strogatz_the_science_of_sync) TED talk mentioned [on youtube](https://www.youtube.com/watch?v=IiXaZGZqpVI)

to find what needs to be abstracted to reduce duplication in the case statement we follow these rules:

### Flocking rules
1. Select the things that are most alike
2. Find the smallest difference between them
3. Make the simplest change that will remove that difference

### 4 steps to changing code:
1. parse the new code (i.e. confirm syntax is valid)
2. parse and execute it (proving the code runs without errors)
3. parse, execute and use it's results (ensuring it returns correct result)
4. delete unused code.

making small changes give precise error messages if you make a big change and get an error you don't understand, revert it and look to make a smaller change.

## 3.7 Converging on Abstractions
### 3.7.1 Focusing on difference
(start here, start reading from the start of this bit)

See the sameness, acknowledge it, feel a bit zen, then look for the difference. 

difference is more meaningful. 
think about DRYing out difference

Book [Design Patterns: Elements of Reusable Object-Oriented Software](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612) mentioned 

Goal: encapsulate the concept that varies. 

two examples represent the same abstraction but contain 1 difference, that difference represents a smaller abstraction within the larger one. "if you can name the difference, you've identified the smaller abstraction"

applying the rules of refactoring converts difference to sameness as part of the process
you don't have to identify the abstractions in preparation for refactoring 

in this way a solution is discovered via refactoring. 

for verse case statement:
1. start with the two branches that are most alike and try to make them identical. (answer: `when 2` and the `else` branches are most identical)

### 3.7.2 Simplifiying Hard Problems

2. make these two branches identical - ignore all tangents that may arise.

first we change the hard coded 2 and 1 to `count` and `count-1` 

now our only difference between the two branches is bottle/bottles on the last phrase. 

What does this difference _mean_?

### 3.7.3 Naming Concepts

to make 2 verses "the same" in code, you have to:
- find the underlying difference and it's abstraction
- name it (name the concept that abstraction represents)
- create a method named after it
- replace the two differences with a common message send (this new method)

in this case - what do the words "bottle" and "bottles" represent in the song?
- naming it "bottle" is simply naming it for it's current implementation and not seeing what "bottle" is in the larger scheme of things
- within the context of the song - "bottle/bottles" doesn't represent pluralization (which... what?)

The new requirement: replace "bottle/bottles" with "six-pack" (where numerically appropriate)
"six-pack" is another example of the mystery abstraction

*the name of a thing should be 1 level of abstraction _higher_ than the thing itself* 
bottle/ bottles/ six-pack are instances of a category - name the category using language of the domain. 

think of a table:
number  xxx
1       bottle
6       six-pack
n       bottles

really, we're trying to label the second column.

think about other relevant "units" 24 - case 12 - half case
what about wine? carafe? juice? boxes soft drinks? cans

What are these things? carafes, cans, bottles, six-packs?

"container" is meaningful, understandable, unambiguous 
"unit" is too vague - this is likely several layers of abstraction above what we're looking for
"pluralisation" - is too broad and doesn't really scope us to bottles/six-packs/cans whathaveyou

### 3.7.4 Making Methodical Transformations
Best to make these changes in a series of small steps rather than all in 1 edit:
- this way you know which changes are successful and which break tests
- code that passes tests throughout the process of making the change could be merged at any point
  - this can help you avoid a mega PR
  - means that if for whatever reason (hit by a bus) the project can continue with someone else taking over

[QUICK REMINDER OF FLOCKING RULES AND COROLLARIES](#flocking-rules) 

- change only 1 line at a time
- run tests after every change
- if you go red, undo and make a better change

Steps:
1. create empty container method (committed)
2. run tests - proves so far, our method is syntactically correct - separating parse from execute (rule 3 a)
3. smallest possible change - make container method work for 1 case - "bottle" or "bottles".
4. run tests
5. replace relevant instances of "bottles" with the message send (method call) #{container}
6. run tests

now to get "container" to take an argument you have to change 2 lines (the method definition and where we call the method)
- which we are trying to avoid doing - we're aiming for 1 change at a time 

### 3.7.5 Refactoring Gradually
Book mentioned: [Refactoring to Patterns by Joshua Keriesvsky](https://archive.org/details/refactoringtopat0000keri)<br>
[Refactoring to Patterns by Joshua Keriesvsky](https://www.amazon.co.uk/Refactoring-Patterns-Addison-Wesley-Signature-Kerievsky/dp/0321213351)

discusses :"Gradual Cutover Refactoring" - keeping code in a releasable state by gradually switching over small pieces at a time
can be done alongside other dev work 

You ought not change everything at once 
you have to figure out howto allow some sends to pass the new argument while others are unchanged
here's where optional arguments that have a set default are handy.

```ruby
def container(number=:FIXME)
  "bottles"
end
```

:FIXME is a default which populates the argument, avoiding an arguments error, and doesn't affect the outcome of the internal code, and reminds us to not see it as permanent FIX ME!!!! "usefully wrong"

next steps:
- Change the receiver (the actual method): if you change `container` to check the value of `number` and return "bottle" or "bottles"
- Change the sender (the method call): alter the `else` branch to add the `number` argument to the `container` call

Refactoring rules say: you must pick ONLY ONE of these as your next step. 
The best choice is to change the receiver (the actual method)

```ruby
  def container(number=:FIXME)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
```

The tests still pass without changing the call or anything, of course, we're only calling container in 1 place and we're not passing it an argument and in that place, it will always be "bottles" so functionally, this is no great change.

Technically this is a multiline change, but, it could be a ternary on one line - it's just easier to read and work with like this. So we're not _really_ breaking the "change only 1 line at a time rule" with this, eventhough to a pedant, we are.

Adding a new branch to the conditional but only executing the previously existing code is an example of the Open/Closed Principle. The `container` method is open to a new requirement, allowing it to change what's returned, but keeping this a quite contained/controlled/small change makes it easier to debug as we go.

Now we change the sender to pass an argument. now we are routing to the "false" branch of the statement because the argument passed IS NOT 1, not because the default argument is not 1, we are now functionally using this method as intended.

with the default you know that if you got to the `false` branch the tests pass
with the argument you know that the argument will get you to the false branch.

both of these scenarios have to work to confirm that the code actually works as intended so it's valid to check both.

In listing 3.17 we modify the `when 2` case and now we are always sending a number when we call `container` - we can delete the :FIXME default.

Also, now the `else` case and the `when 2` case are identical. A next refactor can remove one of these (my guess is - `when 2` because let's remove specificity where we can!)

Horizonal Refactoring notes - steps with * were changes to code:
1. identified verse 2 and else as the most similar cases
2. worked from left to right
3. changed `verse` `2` case to replace hard coded 2 with `#{number}` (count in my case) twice*
4. changed `verse` `2` case to replace hard coded 1 with `#{number-1}` (count)* 
5. identified "bottle" and "bottles" as the next difference
6. chose `container` for the name of the concept represented by this difference
7. created empty `container` method*
8. changed `container` method to return "bottles"*
9. changed `verse` `else` case to send `container` in place of "bottles"*
10. changed `container` to take `number` (count) argument with default `:FIXME`*
11. added conditional logic to `container` to return "bottle" or "bottles" based on `number` (count)*
12. changed `verse` `else` case to pass `number-1` to `container`*
13. changed `verse` `2` case to send `container(number-1)` in place of "bottle"*
14. deleted `verse` `2` case*
15. deleted `container``:FIXME` `number` default argument*

Many several small contained changes, checked at every step by running tests avoids lengthy dubugging sessions so this is fast and low-stress.

You can merge steps and make a couple changes together, but "let red be your guide" if you take a big step and the stest start to fail, undo and break it up into smaller changes.

## 3.8 Summary

Here we used Open-Closed Principle to change chode.
1. Refactor the exisiting code to be open to the new requirement
2. add the new code

When the first step is not obvious, be guided by [code smells](#33-recognising-code-smells)
- improve code by identifying and removing smells
- *have faith that as code improves, the path to openness will appear*

opeing code up to new requirements often requires identifying and naming abstractions the [flocking rules](#flocking-rules) concentrate on turning difference into sameness

/chapter3

[Chapter 2](chapter_2_notes.md)
[Chapter 4](chapter_4_notes.md)
[ReadMe](../README.md)
