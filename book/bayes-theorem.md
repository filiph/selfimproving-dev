You have a database of notes and you want to build a system that intelligently assignes tags to the notes. For example, you write a note like this:

```text
I found out today that
  we're going to have a baby!
  I am really excited.
```

And the system autosuggests adding `#life` and `#baby`.

One easy way to do this is through the so-called Bayes' theorem. By the end of this article, you'll know what that is and how to use it.

But before we get there, let's first make sure you're really expecting that baby! (I promise this is going to be relevant.)

## Probability of babies

Pregnancy tests aren't perfect. They can tell you you're expecting when you're not, and they can tell you you're not expecting when you are. In other words, they can be wrong in two ways: there can be _false positives_ (test says yes, but it's incorrect) and there can be _false negatives_ (test says no, but it's incorrect).

|       |      | Test says YES |  Test says NO |
| --- | --- | --- | --- |
| Actual baby | 👶 | True positive | False negative |
| No baby | ◯ | False positive | True negative |

Although they're not perfect, pregancy tests still do have value, of course. They are _mostly_ correct. Let's say they correctly identify a pregnancy 93% of the time, and correctly identify non-pregnancy 95% of the time.

|       |      | Test says YES |  Test says NO |
| --- | --- | --- | --- |
| Actual baby | 👶 | 93% | 7% |
| No baby | ◯ | 5% | 95% |

So, if you (or your partner) come out of the bathroom with a test result that says YES, what is the probability that you're really having a baby?

You may be tempted to blurt out 93%. But not so fast.

## Prevalence of babies

Forget the quality of the test for a moment. What is the probability that, when you're taking a pregnancy test, you're actually pregnant? Note that we're not talking about the precision of any device here. We're talking about how likely it is you're pregnant, in reality, as you're entering the bathroom with the little testing device in your hand.

Now, look, I can't find any good data on this, so I'll just go ahead and estimate. My guess is that only 10% of the women who decide to take a pregnancy test are pregnant at the time.

<aside>

**Aside:** The actual numbers don't matter at all here. We're not trying to solve a math problem, we're trying to understand Bayes.

</aside>

To find the probabilities of the four different outcomes (true positive, true negative, false positive, false negative) among all the women who take a pregnancy test, we just need to multiply:

|       |      | Test says YES |  Test says NO |
| --- | --- | --- | --- |
| Actual baby (10%) | 👶 | 93%&nbsp;⨯&nbsp;10%&nbsp;=&nbsp;**9.3%** | 7%&nbsp;⨯&nbsp;10%&nbsp;=&nbsp;**0.7%** |
| No baby (90%) | ◯ | 5%&nbsp;⨯&nbsp;90%&nbsp;=&nbsp;**4.5%** | 95%&nbsp;⨯&nbsp;90%&nbsp;=&nbsp;**85.5%** |

It might not be immediately obvious, but the four numbers in bold add up to 100%. That makes sense: if you're taking a pregnancy test, you will obviously fall into one of these four categories.

Note the difference:

* There is a 93% probability that—_given that you are having a baby_—the test says YES. This is about the quality of the test.
* There is a 9.3% probability that a random test-taking woman has a baby _and_ her test says YES. This is about one of the four different outcomes of pregnancy test-taking.

The first probability is higher because it talks about women who we know to be pregnant. The second probability is lower because it talks about any test-taking woman.

## Total probability

So, once again, if you come out of the bathroom with a test result that says YES, what is the probability that you're really having a baby?

<aside>

**Aside:** This is a very different question than: "Given that you're pregnant, what is the probability that your pregnancy test says YES?" The answer to _that_ question is 93%.

</aside>

I'll repeat the table from above here, except now it doesn't show percentages, and instead shows whole numbers. All I did was multiply the percentages by 1000, so that instead of looking at fractions, you can imagine four groups of women. I think it makes things a bit more intuitive.

|       |      | Test says YES |  Test says NO |
| --- | --- | --- | --- |
| Actual baby | 👶 | 93 | 7 |
| No baby | ◯ | 45 | 855 |

If you want, you can try to figure it out yourself now. The question, once again, is: "Given that your test result says YES, what is the probability that you're really having a baby?"

...

**Solution:** We take the group of women with a YES. That is to say, the 93 women with the true positive test, and the 45 women with the false positive test. That's 138 women.

Out of these 138 women, only 93 are actually having a baby. That is to say, 93 out of 138 really are pregnant.

93 divided by 138 is about 67%. That is to say, holding a test result that says YES, the probability you're really pregnant is only 67%.

<aside>

Once again, the actual numbers are made up. I don't actually know the sensitivity of pregnancy tests, or the proportion of women who take them and are pregnant at the time. But the math is correct.

</aside>
    
## Congrats!

It's a girl!

Also, you just gained an intuitive understanding of Bayes' theorem. It's a way to convert results of a test (e.g. pregnancy strip) into the real probability of an event (e.g. pregnancy).

Here's the mathematical formula:

<svg xmlns="http://www.w3.org/2000/svg" width="464.575px" height="55.434px" viewBox="0 -1460 20280.9 2420" xmlns:xlink="http://www.w3.org/1999/xlink" style=""><defs><path id="MJX-16-TEX-I-50" d="M287 628Q287 635 230 637Q206 637 199 638T192 648Q192 649 194 659Q200 679 203 681T397 683Q587 682 600 680Q664 669 707 631T751 530Q751 453 685 389Q616 321 507 303Q500 302 402 301H307L277 182Q247 66 247 59Q247 55 248 54T255 50T272 48T305 46H336Q342 37 342 35Q342 19 335 5Q330 0 319 0Q316 0 282 1T182 2Q120 2 87 2T51 1Q33 1 33 11Q33 13 36 25Q40 41 44 43T67 46Q94 46 127 49Q141 52 146 61Q149 65 218 339T287 628ZM645 554Q645 567 643 575T634 597T609 619T560 635Q553 636 480 637Q463 637 445 637T416 636T404 636Q391 635 386 627Q384 621 367 550T332 412T314 344Q314 342 395 342H407H430Q542 342 590 392Q617 419 631 471T645 554Z"></path><path id="MJX-16-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-16-TEX-I-41" d="M208 74Q208 50 254 46Q272 46 272 35Q272 34 270 22Q267 8 264 4T251 0Q249 0 239 0T205 1T141 2Q70 2 50 0H42Q35 7 35 11Q37 38 48 46H62Q132 49 164 96Q170 102 345 401T523 704Q530 716 547 716H555H572Q578 707 578 706L606 383Q634 60 636 57Q641 46 701 46Q726 46 726 36Q726 34 723 22Q720 7 718 4T704 0Q701 0 690 0T651 1T578 2Q484 2 455 0H443Q437 6 437 9T439 27Q443 40 445 43L449 46H469Q523 49 533 63L521 213H283L249 155Q208 86 208 74ZM516 260Q516 271 504 416T490 562L463 519Q447 492 400 412L310 260L413 259Q516 259 516 260Z"></path><path id="MJX-16-TEX-N-7C" d="M139 -249H137Q125 -249 119 -235V251L120 737Q130 750 139 750Q152 750 159 735V-235Q151 -249 141 -249H139Z"></path><path id="MJX-16-TEX-I-42" d="M231 637Q204 637 199 638T194 649Q194 676 205 682Q206 683 335 683Q594 683 608 681Q671 671 713 636T756 544Q756 480 698 429T565 360L555 357Q619 348 660 311T702 219Q702 146 630 78T453 1Q446 0 242 0Q42 0 39 2Q35 5 35 10Q35 17 37 24Q42 43 47 45Q51 46 62 46H68Q95 46 128 49Q142 52 147 61Q150 65 219 339T288 628Q288 635 231 637ZM649 544Q649 574 634 600T585 634Q578 636 493 637Q473 637 451 637T416 636H403Q388 635 384 626Q382 622 352 506Q352 503 351 500L320 374H401Q482 374 494 376Q554 386 601 434T649 544ZM595 229Q595 273 572 302T512 336Q506 337 429 337Q311 337 310 336Q310 334 293 263T258 122L240 52Q240 48 252 48T333 46Q422 46 429 47Q491 54 543 105T595 229Z"></path><path id="MJX-16-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path><path id="MJX-16-TEX-N-3D" d="M56 347Q56 360 70 367H707Q722 359 722 347Q722 336 708 328L390 327H72Q56 332 56 347ZM56 153Q56 168 72 173H708Q722 163 722 153Q722 140 707 133H70Q56 140 56 153Z"></path><path id="MJX-16-TEX-N-22C5" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250Z"></path><path id="MJX-16-TEX-N-2B" d="M56 237T56 250T70 270H369V420L370 570Q380 583 389 583Q402 583 409 568V270H707Q722 262 722 250T707 230H409V-68Q401 -82 391 -82H389H387Q375 -82 369 -68V230H70Q56 237 56 250Z"></path><path id="MJX-16-TEX-N-AC" d="M56 323T56 336T70 356H596Q603 353 611 343V102Q598 89 591 89Q587 89 584 90T579 94T575 98T572 102L571 209V316H70Q56 323 56 336Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="matrix(1 0 0 -1 0 0)"><g data-mml-node="math"><g data-mml-node="TeXAtom"><g data-mml-node="mstyle"><g data-mml-node="mi"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(751, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(1140, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="TeXAtom" transform="translate(1890, 0)"><g data-mml-node="mo"><use xlink:href="#MJX-16-TEX-N-7C"></use></g></g><g data-mml-node="mi" transform="translate(2168, 0)"><use xlink:href="#MJX-16-TEX-I-42"></use></g><g data-mml-node="mo" transform="translate(2927, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(3593.8, 0)"><use xlink:href="#MJX-16-TEX-N-3D"></use></g><g data-mml-node="TeXAtom" transform="translate(4649.6, 0)"><g data-mml-node="mfrac"><g data-mml-node="mrow" transform="translate(4656.9, 710)"><g data-mml-node="mi"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(751, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(1140, 0)"><use xlink:href="#MJX-16-TEX-I-42"></use></g><g data-mml-node="TeXAtom" transform="translate(1899, 0)"><g data-mml-node="mo"><use xlink:href="#MJX-16-TEX-N-7C"></use></g></g><g data-mml-node="mi" transform="translate(2177, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(2927, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(3538.2, 0)"><use xlink:href="#MJX-16-TEX-N-22C5"></use></g><g data-mml-node="mi" transform="translate(4038.4, 0)"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(4789.4, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(5178.4, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(5928.4, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g></g><g data-mml-node="mrow" transform="translate(220, -710)"><g data-mml-node="mi"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(751, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(1140, 0)"><use xlink:href="#MJX-16-TEX-I-42"></use></g><g data-mml-node="TeXAtom" transform="translate(1899, 0)"><g data-mml-node="mo"><use xlink:href="#MJX-16-TEX-N-7C"></use></g></g><g data-mml-node="mi" transform="translate(2177, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(2927, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(3538.2, 0)"><use xlink:href="#MJX-16-TEX-N-22C5"></use></g><g data-mml-node="mi" transform="translate(4038.4, 0)"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(4789.4, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(5178.4, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(5928.4, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(6539.7, 0)"><use xlink:href="#MJX-16-TEX-N-2B"></use></g><g data-mml-node="mi" transform="translate(7539.9, 0)"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(8290.9, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(8679.9, 0)"><use xlink:href="#MJX-16-TEX-I-42"></use></g><g data-mml-node="TeXAtom" transform="translate(9438.9, 0)"><g data-mml-node="mo"><use xlink:href="#MJX-16-TEX-N-7C"></use></g></g><g data-mml-node="mi" transform="translate(9716.9, 0)"><use xlink:href="#MJX-16-TEX-N-AC"></use></g><g data-mml-node="mi" transform="translate(10383.9, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(11133.9, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(11745.1, 0)"><use xlink:href="#MJX-16-TEX-N-22C5"></use></g><g data-mml-node="mi" transform="translate(12245.3, 0)"><use xlink:href="#MJX-16-TEX-I-50"></use></g><g data-mml-node="mo" transform="translate(12996.3, 0)"><use xlink:href="#MJX-16-TEX-N-28"></use></g><g data-mml-node="mi" transform="translate(13385.3, 0)"><use xlink:href="#MJX-16-TEX-N-AC"></use></g><g data-mml-node="mi" transform="translate(14052.3, 0)"><use xlink:href="#MJX-16-TEX-I-41"></use></g><g data-mml-node="mo" transform="translate(14802.3, 0)"><use xlink:href="#MJX-16-TEX-N-29"></use></g></g><rect width="15391.3" height="60" x="120" y="220"></rect></g></g></g></g></g></g></svg>

<!-- 
  * LaTex: {\displaystyle P(A|B)={\frac {P(B|A) \cdot P(A)}{P(B|A) \cdot P(A)+P(B|\neg A) \cdot P(\neg A)}}}
  * converted with https://viereck.ch/latex-to-svg/
-->

You can read it like this:

* The probability that event A occurs given event B  
  is equal to
* the numerator, which is:
  * the probability that event B occurs given event A  
    times
  * the probability that event A occurs  
* divided by the denominator, which is:
  * the probability that event B occurs given event A  
    times
  * the probability that event A occurs  
    plus
  * the probability that event B occurs given A _didn't_ occur  
    times
  * the probability that event A _didn't_ occur.

Now replace `B` with "pregnancy test says YES" and `A` with "you're pregnant".

<!-- TODO: add the formula with annotations, e.g. P(A) is "probability a test-taking woman is pregnant" -->

## The name

The theorem is named after Reverend Thomas Bayes, an English Presbyterian minister. His work was published in 1763, so this math is well over 250 years old.

![Thomas Bayes](images/Thomas_Bayes.jpg)

<aside>

**Aside:** Whenever I get a bit lost in the probabilities of the theorem, I imagine Reverend Bayes looking at me exactly like in the picture above. "Really, Filip? You can't multiply two numbers?"

</aside>

When we hear "Bayes" these days, it's either because of the theorem above, or because of a related idea of Bayesian probability. In this approach, probabilities aren't just frequencies (e.g. "how many people are over 60 years old?") but can also be strengths of beliefs (e.g. "how much do I believe we'll finish the project in time?").

## Automatic tagging

Which brings us back to our original problem. We have a note-taking app with 1000 notes that are already tagged by the user. We want a system that automatically suggests tags (like `#baby`) for new notes based on what's written in them (like `"Bought a crib today!"`). 

We'll take words in the text, and we'll use Bayes to see how probable it is that, given those words, a tag applies. For example, when there's `"crib"` in the text, how probable is it that the tag `#baby` applies?

|  Test |   | Real event |
| :---: | :---: | :---: |
|  Pregnancy test says YES | ?&rarr; | Pregnancy  |
|  One of the words in the text is `"crib"` | ?&rarr; | Tag `#baby` applies |

<!-- TODO: rebuilt into a drawing with arrows, so that it doesn't look like a table -->

It might not seem like it at first but this is essentially the same problem as above. We have a test, and we want to see how indicative it is of a real event.

Once again, if you're up for it, you can try to figure it out yourself. Try to apply Bayes' theorem to solve auto-tagging. To scope this down, don't try to solve the whole algorithm at once. Just try to figure out a single pair of word & tag. In other words, find out what's the probability of the tag `#baby` given the word `"crib"` in the text. You might want to write things down.

If you're up for it, stop reading now and go figure it out.

...

**Solution:** We want to find the probability that a note should be tagged with `#baby` _given that_ it contains the word `"crib"`. That's our _P(A|B)_. Then, using the formula:

* The probability that a note is tagged with `#baby` _given that_ it contains the word `"crib"`  
  is equal to
* the numerator, which is:
  * the probability that a note contains the word `"crib"`  _given that_ it's tagged with `#baby`  
    times
  * the probability that a note is tagged with `#baby`  
* divided by the denominator, which is:
  * the probability that a note contains the word `"crib"` _given that_ it's tagged with `#baby`  
    times
  * the probability that a note is tagged with `#baby`  
    plus
  * the probability that a note contains the word `"crib"` given that it's _not_ tagged with `#baby`  
    times
  * the probability that a note is _not_ tagged with `#baby`.

<!-- TODO: replace with an annotation of the formula -->

In a note-taking app, we know all those values on the right side of the equation. 

The following code is just a transcript of the steps above into a programming language. It's here in case you prefer reading code. No need to read through it otherwise.

```dart
// All of the user's notes.
var notes = getAllNotes();

// Finding the sets we need.
var notesTaggedWithBaby = notes
    .where(
        (note) => note.hasTag('#baby'))
    .toSet();
var notesWithCrib = notes
    .where(
        (note) => note.hasWord('crib'))
    .toSet();
var notesNotTaggedWithBaby =
    notes.difference(notesTaggedWithBaby);
var notesWithCribTaggedWithBaby =
    notesTaggedWithBaby
        .intersection(notesWithCrib);
var notesWithCribNotTaggedWithBaby =
    notesNotTaggedWithBaby
        .intersection(notesWithCrib);

// Computing the numerator.
var ratioOfNotesWithCribTaggedWithBaby =
    notesWithCribTaggedWithBaby.length /
        notesWithCrib.length;
var ratioOfNotesTaggedWithBabyInGeneral =
    notesTaggedWithBaby.length / notes.length;
var numerator =
    ratioOfNotesWithCribTaggedWithBaby *
        ratioOfNotesTaggedWithBabyInGeneral;

// Computing the denominator.
var ratioOfNotesWithCribNotTaggedWithBaby =
    notesWithCribNotTaggedWithBaby.length /
        notesNotTaggedWithBaby.length;
var ratioOfNotesNotTaggedWithBabyInGeneral =
    notesNotTaggedWithBaby.length /
        notes.length;
var denominator =
    ratioOfNotesWithCribTaggedWithBaby *
            ratioOfNotesTaggedWithBabyInGeneral +
        ratioOfNotesWithCribNotTaggedWithBaby *
            ratioOfNotesNotTaggedWithBabyInGeneral;

var result = numerator / denominator;
print(result);
```

Actually, there is one other reasons to read the code: to find the divide-by-zero bug that we'd need to deal with in a real project. I'll leave that as an exercise to you. Where could the code break and how would you prevent that?

Putting aside trivialities such as division by zero, we're done. Using this code, we can look at words in a new note and compute the probability that the note should be tagged with a particular tag.

```text
$ bayes "crib" "#baby"
76.92%

$ bayes "boss" "#work"
100.00%

$ bayes "today" "#work"
34.78%
```

As more notes are added and tagged, the system learns automatically. Today, there are no `#baby`-tagged notes containing the word `diaper` but trust me: there will be a lot of them in a few short months. And the statistics will just update according to that fact.

## Putting it all together

From here, it's only a few steps to build an auto-suggestion system. We know the probabilities for individual words, but what we want is the probability of the whole note. After all, we're not trying to tag words, we're trying to tag notes in their entirety.

How do we combine the probabilities of the words into a single probability for the whole note? Now, this would be another [few pages](https://www.mathpages.com/home/kmath267/kmath267.htm) of probability formulas, so I'll just jump to the conclusion:

<svg xmlns="http://www.w3.org/2000/svg" width="458.126px" height="47.598px" viewBox="0 -1118 19999 2078" xmlns:xlink="http://www.w3.org/1999/xlink" style=""><defs><path id="MJX-17-TEX-I-70" d="M23 287Q24 290 25 295T30 317T40 348T55 381T75 411T101 433T134 442Q209 442 230 378L240 387Q302 442 358 442Q423 442 460 395T497 281Q497 173 421 82T249 -10Q227 -10 210 -4Q199 1 187 11T168 28L161 36Q160 35 139 -51T118 -138Q118 -144 126 -145T163 -148H188Q194 -155 194 -157T191 -175Q188 -187 185 -190T172 -194Q170 -194 161 -194T127 -193T65 -192Q-5 -192 -24 -194H-32Q-39 -187 -39 -183Q-37 -156 -26 -148H-6Q28 -147 33 -136Q36 -130 94 103T155 350Q156 355 156 364Q156 405 131 405Q109 405 94 377T71 316T59 280Q57 278 43 278H29Q23 284 23 287ZM178 102Q200 26 252 26Q282 26 310 49T356 107Q374 141 392 215T411 325V331Q411 405 350 405Q339 405 328 402T306 393T286 380T269 365T254 350T243 336T235 326L232 322Q232 321 229 308T218 264T204 212Q178 106 178 102Z"></path><path id="MJX-17-TEX-N-3D" d="M56 347Q56 360 70 367H707Q722 359 722 347Q722 336 708 328L390 327H72Q56 332 56 347ZM56 153Q56 168 72 173H708Q722 163 722 153Q722 140 707 133H70Q56 140 56 153Z"></path><path id="MJX-17-TEX-N-31" d="M213 578L200 573Q186 568 160 563T102 556H83V602H102Q149 604 189 617T245 641T273 663Q275 666 285 666Q294 666 302 660V361L303 61Q310 54 315 52T339 48T401 46H427V0H416Q395 3 257 3Q121 3 100 0H88V46H114Q136 46 152 46T177 47T193 50T201 52T207 57T213 61V578Z"></path><path id="MJX-17-TEX-N-32" d="M109 429Q82 429 66 447T50 491Q50 562 103 614T235 666Q326 666 387 610T449 465Q449 422 429 383T381 315T301 241Q265 210 201 149L142 93L218 92Q375 92 385 97Q392 99 409 186V189H449V186Q448 183 436 95T421 3V0H50V19V31Q50 38 56 46T86 81Q115 113 136 137Q145 147 170 174T204 211T233 244T261 278T284 308T305 340T320 369T333 401T340 431T343 464Q343 527 309 573T212 619Q179 619 154 602T119 569T109 550Q109 549 114 549Q132 549 151 535T170 489Q170 464 154 447T109 429Z"></path><path id="MJX-17-TEX-N-22EF" d="M78 250Q78 274 95 292T138 310Q162 310 180 294T199 251Q199 226 182 208T139 190T96 207T78 250ZM525 250Q525 274 542 292T585 310Q609 310 627 294T646 251Q646 226 629 208T586 190T543 207T525 250ZM972 250Q972 274 989 292T1032 310Q1056 310 1074 294T1093 251Q1093 226 1076 208T1033 190T990 207T972 250Z"></path><path id="MJX-17-TEX-I-4E" d="M234 637Q231 637 226 637Q201 637 196 638T191 649Q191 676 202 682Q204 683 299 683Q376 683 387 683T401 677Q612 181 616 168L670 381Q723 592 723 606Q723 633 659 637Q635 637 635 648Q635 650 637 660Q641 676 643 679T653 683Q656 683 684 682T767 680Q817 680 843 681T873 682Q888 682 888 672Q888 650 880 642Q878 637 858 637Q787 633 769 597L620 7Q618 0 599 0Q585 0 582 2Q579 5 453 305L326 604L261 344Q196 88 196 79Q201 46 268 46H278Q284 41 284 38T282 19Q278 6 272 0H259Q228 2 151 2Q123 2 100 2T63 2T46 1Q31 1 31 10Q31 14 34 26T39 40Q41 46 62 46Q130 49 150 85Q154 91 221 362L289 634Q287 635 234 637Z"></path><path id="MJX-17-TEX-N-2B" d="M56 237T56 250T70 270H369V420L370 570Q380 583 389 583Q402 583 409 568V270H707Q722 262 722 250T707 230H409V-68Q401 -82 391 -82H389H387Q375 -82 369 -68V230H70Q56 237 56 250Z"></path><path id="MJX-17-TEX-N-28" d="M94 250Q94 319 104 381T127 488T164 576T202 643T244 695T277 729T302 750H315H319Q333 750 333 741Q333 738 316 720T275 667T226 581T184 443T167 250T184 58T225 -81T274 -167T316 -220T333 -241Q333 -250 318 -250H315H302L274 -226Q180 -141 137 -14T94 250Z"></path><path id="MJX-17-TEX-N-2212" d="M84 237T84 250T98 270H679Q694 262 694 250T679 230H98Q84 237 84 250Z"></path><path id="MJX-17-TEX-N-29" d="M60 749L64 750Q69 750 74 750H86L114 726Q208 641 251 514T294 250Q294 182 284 119T261 12T224 -76T186 -143T145 -194T113 -227T90 -246Q87 -249 86 -250H74Q66 -250 63 -250T58 -247T55 -238Q56 -237 66 -225Q221 -64 221 250T66 725Q56 737 55 738Q55 746 60 749Z"></path></defs><g stroke="currentColor" fill="currentColor" stroke-width="0" transform="matrix(1 0 0 -1 0 0)"><g data-mml-node="math"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="mo" transform="translate(780.8, 0)"><use xlink:href="#MJX-17-TEX-N-3D"></use></g><g data-mml-node="TeXAtom" transform="translate(1836.6, 0)"><g data-mml-node="mfrac"><g data-mml-node="mrow" transform="translate(6831.6, 676)"><g data-mml-node="msub"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-31"></use></g></g></g><g data-mml-node="msub" transform="translate(906.6, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-32"></use></g></g></g><g data-mml-node="mo" transform="translate(1979.8, 0)"><use xlink:href="#MJX-17-TEX-N-22EF"></use></g><g data-mml-node="msub" transform="translate(3318.4, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-4E"></use></g></g></g></g><g data-mml-node="mrow" transform="translate(220, -710)"><g data-mml-node="msub"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-31"></use></g></g></g><g data-mml-node="msub" transform="translate(906.6, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-32"></use></g></g></g><g data-mml-node="mo" transform="translate(1979.8, 0)"><use xlink:href="#MJX-17-TEX-N-22EF"></use></g><g data-mml-node="msub" transform="translate(3318.4, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-4E"></use></g></g></g><g data-mml-node="mo" transform="translate(4721.6, 0)"><use xlink:href="#MJX-17-TEX-N-2B"></use></g><g data-mml-node="mo" transform="translate(5721.8, 0)"><use xlink:href="#MJX-17-TEX-N-28"></use></g><g data-mml-node="mn" transform="translate(6110.8, 0)"><use xlink:href="#MJX-17-TEX-N-31"></use></g><g data-mml-node="mo" transform="translate(6833, 0)"><use xlink:href="#MJX-17-TEX-N-2212"></use></g><g data-mml-node="msub" transform="translate(7833.2, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-31"></use></g></g></g><g data-mml-node="mo" transform="translate(8739.8, 0)"><use xlink:href="#MJX-17-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(9128.8, 0)"><use xlink:href="#MJX-17-TEX-N-28"></use></g><g data-mml-node="mn" transform="translate(9517.8, 0)"><use xlink:href="#MJX-17-TEX-N-31"></use></g><g data-mml-node="mo" transform="translate(10240, 0)"><use xlink:href="#MJX-17-TEX-N-2212"></use></g><g data-mml-node="msub" transform="translate(11240.2, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mn"><use xlink:href="#MJX-17-TEX-N-32"></use></g></g></g><g data-mml-node="mo" transform="translate(12146.8, 0)"><use xlink:href="#MJX-17-TEX-N-29"></use></g><g data-mml-node="mo" transform="translate(12702.5, 0)"><use xlink:href="#MJX-17-TEX-N-22EF"></use></g><g data-mml-node="mo" transform="translate(14041.1, 0)"><use xlink:href="#MJX-17-TEX-N-28"></use></g><g data-mml-node="mn" transform="translate(14430.1, 0)"><use xlink:href="#MJX-17-TEX-N-31"></use></g><g data-mml-node="mo" transform="translate(15152.3, 0)"><use xlink:href="#MJX-17-TEX-N-2212"></use></g><g data-mml-node="msub" transform="translate(16152.6, 0)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-70"></use></g><g data-mml-node="TeXAtom" transform="translate(503, -150) scale(0.707)"><g data-mml-node="mi"><use xlink:href="#MJX-17-TEX-I-4E"></use></g></g></g><g data-mml-node="mo" transform="translate(17333.5, 0)"><use xlink:href="#MJX-17-TEX-N-29"></use></g></g><rect width="17922.5" height="60" x="120" y="220"></rect></g></g></g></g></svg>

<!--
  LaTeX: p={\frac  {p_{1}p_{2}\cdots p_{N}}{p_{1}p_{2}\cdots p_{N}+(1-p_{1})(1-p_{2})\cdots (1-p_{N})}}
  tool: https://viereck.ch/latex-to-svg/
-->

In this formula, _p_ is the probability that the whole note should be tagged with `#baby`. The other numbers (_p<sub>1</sub>_ to _p<sub>N</sub>_) are the probabilities of individual words in that note. So, for example, _p<sub>1</sub>_ could be the probability that a note with `"crib"` in it is tagged with `#baby`. This is what we computed above. Just take those numbers for each of the words in the new note, and plug them in that formula.

Now we get the probability for the whole note:

```text
$ bayes "Crib arrived today..." "#baby"
83.33%

$ bayes "Yet another round of spreadsheets." "#work" 
100.00%

$ bayes "Boss called again." "#baby"
0.00%
```

## What next?

Our system might want to go through all existing tags, and rank them. The tags that are most probable should be suggested to the user. 

I've left out some details, of course, but you should have no trouble filling in the blanks if you decide to implement Bayes' theorem yourself.

<aside>

**Aside:** If you're serious about this particular use of Bayes (auto-tagging), you can read Wikipedia's article on [Bayes spam filtering](https://en.wikipedia.org/wiki/Naive_Bayes_spam_filtering), which is basically the same thing as tagging (except you only have one tag: `#spam`).
    
Another thing to look at is performance, which I chose to completely ignore here. Simple caching of results would take you a long way.

</aside>

The purpose of this article was to give you an intuitive understanding of something quite unintuitive. Bayes is used everywhere from spell checking to driverless cars. Maybe you'll find a use for it in your own work.

If you can compute some ratio (the test), and that ratio is indicative of something interesting (the real event), think about Reverend Bayes.
