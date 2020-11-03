class Note {
  final String text;

  final List<String> _tags;

  final List<String> _words;

  Note(this.text, this._tags) : _words = _tokenize(text);

  bool hasTag(String tag) => _tags.contains(tag);

  bool hasWord(String word) => _words.contains(word);
}

List<String> _tokenize(String text) {
  final word = RegExp(r'[a-z]+', caseSensitive: false);
  return word
      .allMatches(text)
      .map((match) => match.group(0).toLowerCase())
      .toList();
}

final notes = {
  Note(
      "I found out today that we're going to have a baby! I am really excited.",
      ['#life', '#baby']),
  Note("I think I'm going to build a crib.", ['#baby', '#life', '#crafting']),
  Note("Spreadsheets are killing me today. Boss on vacation again.", ['#work']),
  Note(
      "Tried to work with wood today, and hit my finger with a hammer. "
      "Ok, no homemade crib then.",
      ['#baby', '#health']),
  Note("Ugh, the boss never tells me anything.", ['#work']),
  Note(
      "Was the boss's presentation a direct crib of mine? Of course it was. "
      "What a jerk.",
      ['#work']),
  Note("I can't believe the baby's on the way.", ['#life', '#baby']),
  Note("Saw an ad for baby boots today. Never worn, apparently.",
      ['#life', '#baby']),
  Note("I'm swimming in spreadsheets today.", ['#work']),
  Note("Going to the gym!", ['#health']),
};

double probabilityOfTagForWord(Set<Note> notes, String word, String tag) {
  // Finding the sets we need.
  var notesTaggedWithTag = notes.where((note) => note.hasTag(tag)).toSet();
  var notesWithWord = notes.where((note) => note.hasWord(word)).toSet();
  var notesNotTaggedWithTag = notes.difference(notesTaggedWithTag);
  var notesWithWordTaggedWithTag =
      notesTaggedWithTag.intersection(notesWithWord);
  var notesWithWordNotTaggedWithTag =
      notesNotTaggedWithTag.intersection(notesWithWord);

  // Computing the numerator.
  var ratioOfNotesWithWordTaggedWithTag =
      notesWithWordTaggedWithTag.length / notesWithWord.length;
  var ratioOfNotesTaggedWithTagInGeneral =
      notesTaggedWithTag.length / notes.length;
  var numerator =
      ratioOfNotesWithWordTaggedWithTag * ratioOfNotesTaggedWithTagInGeneral;

  // Computing the denominator.
  var ratioOfNotesWithWordNotTaggedWithTag =
      notesWithWordNotTaggedWithTag.length / notesNotTaggedWithTag.length;
  var ratioOfNotesNotTaggedWithTagInGeneral =
      notesNotTaggedWithTag.length / notes.length;
  var denominator =
      ratioOfNotesWithWordTaggedWithTag * ratioOfNotesTaggedWithTagInGeneral +
          ratioOfNotesWithWordNotTaggedWithTag *
              ratioOfNotesNotTaggedWithTagInGeneral;

  return numerator / denominator;
}

void main(List<String> args) {
  if (args.length != 2) {
    print("Must provide two arguments: [word] [tag].");
    return;
  }

  var note = args[0];
  var tag = args[1];

  var words = _tokenize(note);

  var probabilities = words
      .map((word) => probabilityOfTagForWord(notes, word, tag))
      .where((p) => p.isFinite)
      .toList();

  var multiplied = probabilities.fold(
      1, (previousValue, element) => previousValue * element);
  var negativeMultiplied = probabilities.fold(
      1, (previousValue, element) => previousValue * (1 - element));

  var result = multiplied / (multiplied + negativeMultiplied);

  print((result * 100).toStringAsFixed(2) + '%\n');
}

/// This is hardcoded with `crib` and `baby`, for easier reading.
void main_crib_baby() {
  // Crib example.

  // Finding the sets we need.
  var notesTaggedWithBaby = notes.where((note) => note.hasTag('#baby')).toSet();
  var notesWithCrib = notes.where((note) => note.hasWord('crib')).toSet();
  var notesNotTaggedWithBaby = notes.difference(notesTaggedWithBaby);
  var notesWithCribTaggedWithBaby =
      notesTaggedWithBaby.intersection(notesWithCrib);
  var notesWithCribNotTaggedWithBaby =
      notesNotTaggedWithBaby.intersection(notesWithCrib);

  // Computing the numerator.
  var ratioOfNotesWithCribTaggedWithBaby =
      notesWithCribTaggedWithBaby.length / notesWithCrib.length;
  var ratioOfNotesTaggedWithBabyInGeneral =
      notesTaggedWithBaby.length / notes.length;
  var numerator =
      ratioOfNotesWithCribTaggedWithBaby * ratioOfNotesTaggedWithBabyInGeneral;

  // Computing the denominator.
  var ratioOfNotesWithCribNotTaggedWithBaby =
      notesWithCribNotTaggedWithBaby.length / notesNotTaggedWithBaby.length;
  var ratioOfNotesNotTaggedWithBabyInGeneral =
      notesNotTaggedWithBaby.length / notes.length;
  var denominator =
      ratioOfNotesWithCribTaggedWithBaby * ratioOfNotesTaggedWithBabyInGeneral +
          ratioOfNotesWithCribNotTaggedWithBaby *
              ratioOfNotesNotTaggedWithBabyInGeneral;

  var result = numerator / denominator;
  print((result * 100).toStringAsFixed(2) + '%\n');
}

// Map<String, WordStat> computeStats(
//     Iterable<Note> notes) {
//   var allWords =
//       notes.expand((note) => note.words).toSet();
//   var allTags =
//       notes.expand((note) => note.tags).toSet();
//
//   final words = <String, WordStat>{};
//
//   for (final word in allWords) {
//     var prevalence = notes
//             .where((n) => n.words.contains(word))
//             .length /
//         notes.length;
//     words[word] = WordStat(word, prevalence);
//   }
//
//   for (final tag in allTags) {
//     var taggedNotes = notes
//         .where((note) => note.tags.contains(tag))
//         .toSet();
//     for (final word in allWords) {
//       var prevalenceGivenTag = taggedNotes
//               .where(
//                   (n) => n.words.contains(word))
//               .length /
//           taggedNotes.length;
//       words[word].probabilities[tag] =
//           prevalenceGivenTag;
//     }
//   }
//
//   return words;
// }

class WordStat {
  final String word;
  final double prevalence;
  final Map<String, double> probabilities = {};

  WordStat(this.word, this.prevalence);

  @override
  String toString() {
    return "$word (prevalence: $prevalence, probs: $probabilities)";
  }
}

class WordGivenTag {
  String word;
  String tag;
  double probability;
}
