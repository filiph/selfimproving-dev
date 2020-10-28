Generics look scary. At least they looked scary to me when I first
started seeing them in code, not knowing what they were. All those
`List<int>` and `Foo<T>` just don’t seem too friendly to an untrained
eye. But they are everywhere, and they are very useful.

Here’s an attempt to explain generic types in the most straightforward
way possible, the way I would have wanted someone to explain them to me
when I first encountered them.

Why generics
------------

Imagine you’re working on a horse-riding app and at one point you
realize it would be great to have a class that pairs two strings
together. Let’s say you want to pair a rider’s name with a horse’s name.
I know it’s a silly example, but bear with me.

```dart
class StringPair {
  String first;
  String second;

  /// The constructor. It just 
  /// assigns to the fields above.
  StringPair(this.first, this.second);

  /// A handy method.
  void describe() {
    print('$first - $second');
  }
}
```

(This code is in Dart, but the programming language doesn’t really
matter. Generics are in most modern languages. And Dart is
[boring](https://selfimproving.dev/the-power-of-boring/) enough that you
shouldn’t have trouble reading the above code even if you haven’t seen
the language before.)

The class `StringPair` is useful. It lets you pair any two strings into
a single object, and it gives you a nice method to boot.

```dart
var winningTeam = StringPair('Filip', 'Horsey');
winningTeam.describe();
```


Mission accomplished, right?

Right. Except, a few weeks later, you’re working on some other part of
your horse-riding app, and you realize that a pair of numbers would be
also useful. So you write this:

```dart
class IntPair {
  int first;
  int second;

  /// The constructor. It just 
  /// assigns to the fields above.
  IntPair(this.first, this.second);

  /// A handy method.
  void describe() {
    print('$first - $second');
  }
}
```

Yes, that’s right. `StringPair` and `IntPair` are *exactly* the same,
except for that type. And then you realize you also need a `PersonPair`,
a `HorsePair`, and a `SugarCubePair` (or whatever).

And, without generic types, you can’t really combine the classes in any
meaningful way. `String`, `int`, `Person`, `Horse` and `SugarCube` are
completely different types. Sure, you could abandon type safety and do
this:

```dart
class DynamicPair {
  dynamic first;
  dynamic second;

  /// The constructor. It just 
  /// assigns to the fields above.
  DynamicPair(this.first, this.second);

  /// A handy method.
  void describe() {
    print('$first - $second');
  }
}
```

But that sucks. Once you use `DynamicPair`, you’ll lose all type
information. For example, nothing stops you from unwittingly creating a
pair that combines two different types, like
`DynamicPair(42, 'Horsey')`. You’ll make your code less secure, and your
coding experience worse (because the IDE can’t give you good code
completion, and because you’ll see errors only *after* you compile, not
before).

Enter generics
--------------

Imagine creating a *template* for the compiler that says something like
“I’m not sure what type will go here yet, but I’ll need many classes
like this.” That’s what generics are. They are a template. (Now you also
know why generics are called
[templates](http://www.cplusplus.com/doc/oldtutorial/templates/) in
C++.)

Observe:

```dart
class Pair<T> {
  T first;
  T second;

  /// The constructor. It just 
  /// assigns to the fields above.
  Pair(this.first, this.second);

  /// A handy method.
  void describe() {
    print('$first - $second');
  }
}
```

The `<T>` after `Pair` tells the compiler that the class is generic. It
also tells the compiler that you’re going to use one *type argument*,
and that you’re naming the argument `T`. The type argument is the thing
you’ll later fill with concrete types such as `String` or `SugarCube`.
It’s the ‘blank’ in the template. You can have more than one type
argument with something like `<T, S>`, but let’s keep things simple here
with just one.

By convention, people name type arguments with single-character names
such as `T` or `S`. Technically, you can call your type arguments
whatever you want. But I encourage you to keep with the convention
unless you have a strong reason not to.

Most people read generics as “of”. So, you can read `Pair<T>` by saying
“Pair of T”, and `List<String>` by saying “List of String”.

Once we tell the compiler about the type argument, we can use it. In the
`Pair` example above, it’s just used twice in the code.

```dart
T first;
T second;
```

But those two `T`s do a lot of work. Our constructor will only accept
arguments that are of the same type:

```dart
// This is okay.
var winningTeam = Pair('Filip', 'Horsey');

// The following line will not compile.
var losingTeam = Pair(13, 'Scooby');
```

Accessing the fields will be statically type-checked.

```dart
var lucky = Pair(7, 77);

// This is okay. Compiler knows both
// fields are numbers.
var result = lucky.second / lucky.first;

// The following line will not compile.
// There is no match() method on numbers.
print(lucky.first.match('luck'));
```

You’ll also get correct code completion. In other words, despite the
fact there is just one generic class, it acts like it was `IntPair` for
`int`s, `StringPair` for `String`s, and so on.

You can be explicit when using a generic class, like here:

```dart
var riders = Pair<Person>(filip, someOtherFool);
```

Normally, at least in Dart, you don’t need this because the compiler can
*infer* the type. It sees you’re using two persons, so it knows this is
a `Pair<Person>`. But sometimes it’s useful to provide the type argument
directly.

I guess it’s also more illustrative: you’re telling the compiler that,
in case of the `riders` variable, `T` is `Person`.

Limiting the type
-----------------

Imagine you have a class hierarchy like this:

```dart
abstract class LivingThing {
  /// Returns the current heart rate.
  int get heartRate;

  /// Returns true if this thing
  /// is healthy.
  bool get isHealthy;
}

class Person extends LivingThing {
  // ...

  bool get isHealthy {
    if (heartRate > 160) return false;
    if (heartRate < 40) return false;
    return true;
  }
}

class Horse extends LivingThing {
  // ...

  bool get isHealthy {
    if (heartRate > 40) return false;
    if (heartRate < 30) return false;
    return true;
  }
}
```

Now you’d like to create a generic class for groups of living things.
This is different from `Pair<T>` above, because now `T` cannot accept
just any type. `T` must now be a subtype of `LivingThing`. This is
something you’ll often want.

The technical name for this is *bounded type parameters* (as in, there
are bounds, limits, constrains to what the type `T` can be). This is
what it looks like in code:

```dart
class Group<T extends LivingThing> {
  List<T> members;

  Group(this.members);

  /// Returns true if everyone 
  /// in the group is healthy.
  bool performHealthCheck() {
    for (var member in members) {
      if (!member.isHealthy) {
        return false;
      }
    }
    return true;
  }
}
```

Note how we can call `member.isHealthy`. The compiler knows the getter
is there, because it knows `member` is of class `T`, and `T` extends
`LivingThing`.

Also, by the way, note how we can use `T` as a type parameter for fields
inside the class:

```dart
List<T> members;
```

Remember, `T` is just a placeholder. It will be replaced by `Person` or
`Horse`. So, with this line, we’re saying: our class `Group` will have a
list of members, and that list will only include objects of whatever
type `T` is.

Now, you can use `Group`:

```dart
var stable = Group([filip, someOtherFool, horsey]);
if (stable.performHealthCheck()) {
  print('All good!');
} else {
  print('Oh no!');
}
```

In this scenario, `stable` is a `Group<LivingThing>` (because
`LivingThing` is the only class that includes both `filip` and
`someOtherFool` (who are persons) *and* `horsey` (who’s a horse)). You
can also have a `Group<Horse>` with only horses, of course, or
`Group<Person>` with only people.

Generics everywhere
-------------------

You’ll find generics everywhere. Most (if not all) collections — such as
lists, sets, maps, queues, etc. — use generics. Many libraries benefit
from using generics, because they want to be type safe but also
*generic* enough to support a variety of use cases. (And now you know
why they’re called generics in Java, Dart, TypeScript, C\# and many
other programming languages.)

I’ve only talked about generic classes, but you can also have generic
methods.

```dart
/// Toggles the existence of [attribute]
/// in a set of [attributes], regardless
/// of their type.
void toggle<T>(T attribute, Set<T> attributes) {
  if (attributes.contains(attribute)) {
    attributes.remove(attribute);
  } else {
    attributes.add(attribute);
  }
}

var numbers = {1, 4, 5, 10};
toggle(4, numbers);

var strings = {'healthy', 'fit'};
toggle('happy', strings);
```

You can also find generics inside generics, like with a
`Pair<Pair<int>>`. I’ll let you parse what that is on your own.

Wrapping up
-----------

There you go. Generics seem very foreign at first, but they’re not
terribly hard. `Pair<Person>` is just a “pair of person.” The `T` is
just a placeholder for a type that could be anything.

Generics let us keep type safety while working with a variety of
classes, without repetition. Type safety translates directly to things
like:

-   Better code completion
-   Faster execution
-   Less bugs

Try it now
----------

I encourage you to create a generic class or method *right now*, if you
still have 5 minutes to spare. Research suggests that *doing* (instead
of just *reading* about) something makes learning a lot more effective.
If you don’t have an idea on how to apply your new knowledge, and if you
don’t mind working in Dart, I made a small [example for you to fix using
generics](https://dartpad.dartlang.org/99f502497a3fd2d42543323945ffeaf3).
