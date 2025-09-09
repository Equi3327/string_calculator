int add(String numbers) {
  if (numbers.isEmpty) return 0;

  var delimiters = [',', '\n'];
  String numString = numbers;

  if (numbers.startsWith('//')) {
    var parts = numbers.split('\n');
    var delimiterPart = parts[0].substring(2);
    numString = parts.sublist(1).join('\n');

    var delimiterRegex = RegExp(r'\[(.*?)\]');
    var matches = delimiterRegex.allMatches(delimiterPart);

    if (matches.isNotEmpty) {
      for (var m in matches) {
        delimiters.add(RegExp.escape(m.group(1)!));
      }
    } else {
      delimiters.add(RegExp.escape(delimiterPart));
    }
  }

  var regex = RegExp(delimiters.join('|'));

  var parsed = numString
      .split(regex)
      .where((s) => s.isNotEmpty)
      .map(int.parse)
      .where((n) => n <= 1000)
      .toList();

  var negatives = parsed.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(",")}');
  }

  return parsed.isEmpty ? 0 : parsed.reduce((a, b) => a + b);
}
