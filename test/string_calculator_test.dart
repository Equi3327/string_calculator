import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('returns 0 for empty string', () {
    expect(add(''), 0);
  });

  test('returns number itself for single input', () {
    expect(add('1'), 1);
  });

  test('returns sum of two comma-separated numbers', () {
    expect(add('1,5'), 6);
  });

  test('returns sum of multiple comma-separated numbers', () {
    expect(add('1,2,3,4'), 10);
  });

  test('handles newlines as well as commas', () {
    expect(add('1\n2,3'), 6);
  });

  test('supports custom delimiter', () {
    expect(add('//;\n1;2'), 3);
  });

  test('throws on negative numbers with message', () {
    expect(
      () => add('1,-2,3,-4'),
      throwsA(predicate((e) =>
          e is Exception &&
          e.toString().contains('negative numbers not allowed -2,-4'))),
    );
  });
}

