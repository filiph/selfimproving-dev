

void main() {
  var result = checkIdentical("spam", "spam");
  print(result);
  print(hashString("SPAM"));
  print(42.hashCode);
  print((BigInt.parse('1' + ('0' * 100))).hashCode);
  print(3.14.hashCode);
  print(BigInt.parse('c2ae38f8a70d51dd003d137d4fff06f9eb4d1647', radix: 16));
}

/// Naive string comparison.
bool checkIdentical(String a, String b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a.codeUnits[i] != b.codeUnits[i]) {
      return false;
    }
  }
  return true;
}

/// Naive hashing function.
int hashString(String a) {
  var hash = 0;
  for (var character in a.codeUnits) {
    hash += character;
  }
  return hash;
}

class Vector {
  int x;
  int y;

  Vector(this.x, this.y);

  @override
  int get hashCode {
    // Fix this!
    return x + y;
  }
}

void expectDifferent(List<int> a, List<int> b) {
  var va = Vector(a[0], a[1]);
  var vb = Vector(b[0], b[1]);

  print('comparing (${va.x}, ${va.y}) and (${vb.x}, ${vb.y})');
  if (va.hashCode == vb.hashCode) {
    print('❌ they are the same! (${va.hashCode})');
  } else {
    print('✅ they are different (${va.hashCode} vs ${vb.hashCode})');
  }
}

void main2() {
  expectDifferent([2, 3], [3, 2]);
  expectDifferent([1, 1], [-1, -1]);
  expectDifferent([1, 1], [10, 10]);
  expectDifferent([1, 1], [-1, -1]);
  expectDifferent([1, 1], [-1, -1]);
}
