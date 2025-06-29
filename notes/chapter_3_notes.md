# 3: Unearthing Concepts

## 3.1 Listening to Change

>Most cost-effective code is as good as necessary - no better

chosing to refactor now rather than later may cost opportunities (working on other problems)

new requirements tell you:
* exactly how the code should change - no need to speculate about the future
* imposes higher standards on affected code - code that needs to be change must be changeable

### 99 Bottles New Requirement!!!

* feature request: output "1 six-pack" any time it currently says "6 bottles"
  * *NB:* this is specific to "1 six-pack"
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
**Single Reponsibility**<br>
methods in a class should be cohesive around a single purpose<br>
**Open - Closed**<br>
Objects should be open for extension, but closed for modification<br>
**Liskov Substitution**<br>
Subclasses should be substitutable for their superclasses.<br>
**Interface Secregation**<br>
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

1. is code open to new requirement?
  a. yes: write the new bit of code
  b. no: do you know how to alter the code to make it open to the new requirement?
    i. yes: make alteration then return to **1**
    ii. no: look for code smells, isolate these flaws, correct one, return to **1** repeat until the answer to **1** is *a* and you can move forward with new code.

## 3.3 Recognising Code Smells
(start here next time!)


/chapter3
[ReadMe](../README.md)
