> The way we present tech can lead to bad tech stack decisions

Here’s how you get most people excited about a new programming language,
framework, or SDK: you show how it makes *something simple* even
simpler.

The epitome of this is the ‘hello world’ program or the TODO app.

People get excited when you show them how to go from scratch to a simple
app in five minutes. It’s effective. It’s easy to do. It’s cool. It can
be jaw-dropping. But it’s also dishonest. I call it the ‘Hello World’
Fallacy.

The problem with it is hopefully obvious: **most developers, most of the
time, don’t write hello world apps**. The more productive and the more
senior the developer is, the less they’re starting simple projects from
scratch, and the more they’re maintaining huge applications.

With large, ongoing software projects, a lot of the features that help
with simple demo apps become irrelevant. Or worse, they become
disadvantages and bottlenecks, and sometimes downright obstacles to any
further development.

A classic example of this is the sliding scale of readability versus
writability. For a demo, it’s cool and useful to be able to express a
lot in one line. Even better if you do it in some clever way. For a
large software project, though, *that same feature* can have nightmarish
consequences.

![Exploding head](images/hello-world-fallacy-explode-head.gif)

Another example is project setup. A framework that is easy to get
started with is perfect for demos. But sometimes (sometimes!) the
effortlessness comes with a price: there’s some weird magic going on
that you’ll hit much later, or it’s hard to configure when you try to do
some serious work.

To clarify: I’m *not* saying that frameworks and libraries and SDKs
shouldn’t strive for the easiest setup process possible. I’m just saying
that they sometimes optimize for it to the detriment of more important
considerations.

I could go on with different design decisions that look one way with a
demo, and completely opposite way with a large project.

I don’t know how to fix this. I guess awareness helps. The next time you
see someone show you something simple with a cool new tech, try and
imagine how that feature scales in a 100KLOC+ project. (That’s
a *lot* of imagination, to be sure.) The next time you’re furious with
some tech that it takes *ages* to set up correctly, think about the
number of times you’ll be setting it up, versus the time spent actually
building your projects afterwards.

But it’s not just about the audience, of course. The ‘Hello World’
Fallacy is something that speakers/bloggers should be aware of, and
ideally, something they will then avoid. I, for one, have been trying to
steer clear of TODO apps and hello worlds in my presentations and
blogposts for a few years now. When I do live coding demos, I try to
show how to maintain (or add a feature to) an existing project.

It’s less ‘sexy’, more error-prone, and generally harder. But it’s also
more honest and, in the long run, more useful to the audience.

*(This article initially appeared on my Medium account.)*
