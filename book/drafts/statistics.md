You don’t need to be a statistician to get useful info from statistics.
But stats looks scary, especially if you start reading a general-purpose
statistics book.

In this article, I’m going to go through the bare minimum you’ll want to
know as a software developer. I’ll simplify *a ton*. The hope is that,
if you find this article useful, you’ll want to know more, and you’ll be
equipped to find the right resources.

## The problem

Which is faster? Optimization or base?

## Certainty vs Confidence interval

You can never say anything with 100 % certainty.

## Tips

### Decide at the start

Don’t fiddle with what certainty you want *after* you’ve started
measuring. It’s very easy to unwittingly “massage” the stats to say what
you want them to say.

For example, let’s say you decide you want to be 95 % certain that an
optimization is better than the base before committing the optimization.
Then your measurements say they are not significantly different. But you
look at the graph and it looks like the optimization is a bit better. So
you say, “you know what, I don’t need to be 95% certain, let’s go to
68%”. Suddenly, your results agree with you. You’re happy. Except, you
just made an exception just because you wanted, and there is a 32%
chance you’re wrong.

Better to decide once, and then stand by your decision. Maybe you’re
okay with 68% certainty from the outset. That’s okay. Just as long as
you don’t fiddle with it later.

### A/A testing
