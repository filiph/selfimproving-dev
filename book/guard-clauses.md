Here's a very simple idea that can make your code a lot easier to read.
First, take in the following function:

```dart
void describeEating(Item item) {
  if (!item.isFood) {
    print("Wait, that's not even food!");
  } else {
    if (item.isDelicious) {
      print("Hmm, that was good.");
    } else {
      print("Not bad. Nutritious.");
    }
  }
}
```

*(Snippets on this blog are generally in Dart, but I take care that
they're simple enough that you'll understand them even if you've never
seen a single line of Dart code. Dart being a
[boring](https://selfimproving.dev/the-power-of-boring/) programming
language helps.)*

The code is not bad. There is no bug. But note how the main part of the
function, the part that deals with food, is already indented, and
follows an `else` keyword.

-   The indentation is not a big deal now, but if the function grows in
    size, and if there are several if-statements like the one above, you
    can imagine it can become somewhat unwieldy.
-   The fact that the "happy path" of the function (the case in which
    the item is edible) follows an `else` statement requires the reader
    to find the `if` statement all the way above, and then mentally flip
    the Boolean logic. Once again, you can imagine it only gets worse as
    the function grows in complexity.

## Solution

In situations like this, try using a **guard clause**. Observe:

```dart
void describeEating(Item item) {
  if (!item.isFood) {
    print("Wait, that's not even food!");
    return;
  }

  if (item.isDelicious) {
    print("Hmm, that was good.");
  } else {
    print("Not bad. Nutritious.");
  }
}
```

The if-statement at the top is our guard clause. It checks for a
condition that would make all the logic below it meaningless. If it's
not food we're eating, then we obviously don't want to spend a lot of
time in a `describeEating` function. The guard clause just does what's
necessary (in our case, it prints a disgusted message), and bails out
from the function with a `return`.

Because it bails out, there is no need for an `else` statement.

## Benefits

-   Guard clauses get rid of some of the indentation in your code, and
    some of the if-else spaghetti code.
-   They make it clear to the reader what the invalid values and edge
    cases are.
-   They can get rid of some very, very long if-statements (think `if`
    at the top of a function, and then twenty lines of code inside that
    conditional block).
-   By having guard clauses at the beginning of the function, you avoid
    having `return` statements and `throw` statements in the middle of
    functions (those are really hard to reason about, and are often
    missed completely by readers, causing bugs down the line).
-   As hinted above, you can also use guard clauses to `throw` instead
    of returning normally. That way, you take care of the invalid states
    at the top of your function.

## The name

I see guard clauses as brave knights who defend the rest of the function
from bad or irrelevant visitors. They stand at the gates (the top of the
function) as guards. So, the name fits well.

## Try it now

I encourage you to try using a guard clause *right now*, if you still
have 5 minutes to spare. Research suggests that *doing* (instead of just
*reading* about) something makes learning a lot more effective. If you
don't have an idea on how to apply your new knowledge, and if you don't
mind working in Dart, I made a small [example for you to refactor using
guard
clauses](https://dartpad.dartlang.org/6f56709c39c594413ed6af61d0c4f73c).
