int add(String numbers) {
  if (numbers.isEmpty) return 0;

  var delimiters = [',', '\n'];
  String numString = numbers;

  if (numbers.startsWith('//')) {
    var parts = numbers.split('\n');
    var customDelimiter = parts[0].substring(2);
    delimiters.add(RegExp.escape(customDelimiter));
    numString = parts[1];
  }

  var regex = RegExp('[${delimiters.join()}]');
  var parsed = numString.split(regex).map(int.parse).toList();

  var negatives = parsed.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('negative numbers not allowed ${negatives.join(",")}');
  }

  return parsed.reduce((a, b) => a + b);
}
