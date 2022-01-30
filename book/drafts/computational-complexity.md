#selfimprovingdev 

# Computational complexity: O(1), O(n), O(n²), oh my...

About: https://en.wikipedia.org/wiki/Time_complexity and https://en.wikipedia.org/wiki/Space_complexity (and https://en.wikipedia.org/wiki/Computational_complexity in general), and https://en.wikipedia.org/wiki/Big_O_notation
IMAGE: https://en.wikipedia.org/wiki/Eratosthenes

Eratosthenes was an ancient Greek ~~developer~~, I mean mathematician, who was really into prime numbers. Back then, prime numbers were kind of a new thing, and everyone was very excited. There were folks who thought that mathematically interesting numbers are, basically, magic.

The way to compute prime numbers the most straightforward (naive) way is something like this:

```dart
void printPrimes(int max) {
  // Number 1 is prime by definition.
  print('1');

  // Take each number.
  for (var i = 2; i < max; i++) {
    var isPrime = true;

    // Check if it's divisible by any smaller number.
    for (var j = 2; j < i; j++) {
      if (i % j == 0) {
        isPrime = false;
        break; // TODO: Maybe remove this to show worse complexity first? But only if it's O(n2) vs O(n log(n)).
      }
    }

    // Print if it's not.
    if (isPrime) {
      print(i);
    }
  }
}
```

But remember, this was some 1800 years ago, and CPUs were in short supply. So, computing primes took Eratosthenes and people like him *a lot of time.* Imagine having to actually do the counting and the division yourself.

Motivated to cut his computational time, and improve his prime-number-crunching performance, Eratosthenes came up with a better algorithm:

```dart
TODO: eratosthenes Sieve
```

This is better. But, how much better?

TODO: 

- Graphs: Let's run these algorithms in a benchmark
- For small numbers, it doesn't really matter
- Looks like we won't care about the exact shape of the curve, but the "tail" (asymptotic behavior)
- Zoom out the graph
- We can identify some "classes" of asymptotic behavior. From constant time (no matter how big a number, it always takes the same amount of time), to something like factorial time.
- We write this down as O(?)
- Worst case / average case (/ best case?)
- Computational vs space complexity
- How to compute? (outside scope of this article) - https://stackoverflow.com/a/11032063/1416886 
	- > You add up how many machine instructions it will execute as a function of the size of its input, and then simplify the expression to the largest (when N is very large) term and can include any simplifying constant factor.
	- And the answer below that: "In general, doing something with every item in one dimension is linear, doing something with every item in two dimensions is quadratic, and dividing the working area in half is logarithmic. There are other Big O measures such as cubic, exponential, and square root, but they're not nearly as common."
- Practically: https://www.bigocheatsheet.com/


---

https://en.wikipedia.org/wiki/Computational_complexity#Asymptotic_complexity

> It is generally difficult to compute precisely the worst-case and the average-case complexity. In addition, these exact values provide little practical application, as any change of computer or of model of computation would change the complexity somewhat. Moreover, the resource use is not critical for small values of n, and this makes that, for small n, the ease of implementation is generally more interesting than a low complexity.
> 
> For these reasons, one generally focuses on the behavior of the complexity for large n, that is on its [asymptotic behavior](https://en.wikipedia.org/wiki/Asymptotic_analysis "Asymptotic analysis") when n tends to the infinity. Therefore, the complexity is generally expressed by using [big O notation](https://en.wikipedia.org/wiki/Big_O_notation "Big O notation").