import 'dart:io';

void main() {
  final input = (File('inputs/day1.txt').readAsLinesSync());

  var number = 0;
  for (int i = 0; i < input.length; i++) {
    //lines
    final s = input[i].split('');
    final first = removeFirstNum(
      s,
    );
    final last = removeFirstNum(s.reversed.toList());

    number = number + int.parse('$first$last');
  }
  print(number);
}

int removeFirstNum(List<String> s) {
  for (var character in s) {
    final number = int.tryParse(character);
    if (number != null) {
      return number;
    }
  }
  return 0;
}
