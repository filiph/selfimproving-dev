import 'dart:async';
import 'dart:html';

/// This is running on index.html (the main page). It switches between
/// different intermediate topics.
void main() {
  final switcher = querySelector('#switcher');
  var index = 0;
  Timer.periodic(const Duration(milliseconds: 1500), (timer) {
    switcher.classes.add('invisible');

    void doSwitch() {
      index = (index + 1) % topics.length;
      switcher.text = '${topics[index]}.';
      switcher.classes.remove('invisible');
    }

    Timer(const Duration(milliseconds: 200), doSwitch);
  });
}

const topics = [
  'reification',
  'generics',
  'AST',
  'the skill of finishing',
  '#deadbeef',
  'computational complexity',
  'genetic programming',
  'pointers',
  'fuzzy logic',
  'Markov chains',
  'declarative programming',
  'DSLs',
  'covariance',
  'tree shaking',
  'Map Reduce',
  'guard clauses',
  'variable shadowing',
  'data mining',
  'effective communication',
  'hashing',
  'A* search',
  'intentional practice',
];
