import 'dart:io';

void main() {
  final input = (File('inputs/day1-2.txt').readAsLinesSync());

  var number = 0;
  for (var element in input) {
    final charList = element.split('').toList();
    final firstNumber = getFirstNum(charList);
    final lastNumber = getLastNumber(charList);

    number = number + int.parse('$firstNumber$lastNumber');
  }
  print(number);
}

int getFirstNum(List<String> charList) {
  for (int index = 0; index < charList.length; index++) {
    final character = charList[index];
    if (int.tryParse(character) != null) {
      return int.parse(character);
    }

    switch (character) {
      case 'e':
        if (charList[index + 1] == 'i' &&
            charList[index + 2] == 'g' &&
            charList[index + 3] == 'h' &&
            charList[index + 4] == 't') {
          return 8;
        }

      case 't':
        if (charList[index + 1] == 'w' && charList[index + 2] == 'o') {
          return 2;
        }
        if (charList[index + 1] == 'h' &&
            charList[index + 2] == 'r' &&
            charList[index + 3] == 'e' &&
            charList[index + 4] == 'e') {
          return 3;
        }
      case 'o':
        if (charList[index + 1] == 'n' && charList[index + 2] == 'e') {
          return 1;
        }
      case 'n':
        if (charList[index + 1] == 'i' &&
            charList[index + 2] == 'n' &&
            charList[index + 3] == 'e') {
          return 9;
        }
      case 'f':
        if (charList[index + 1] == 'o' &&
            charList[index + 2] == 'u' &&
            charList[index + 3] == 'r') {
          return 4;
        }
        if (charList[index + 1] == 'i' &&
            charList[index + 2] == 'v' &&
            charList[index + 3] == 'e') {
          return 5;
        }
      case 's':
        if (charList[index + 1] == 'i' && charList[index + 2] == 'x') {
          return 6;
        }
        if (charList[index + 1] == 'e' &&
            charList[index + 2] == 'v' &&
            charList[index + 3] == 'e' &&
            charList[index + 4] == 'n') {
          return 7;
        }
    }
  }

  return 0;
}

int getLastNumber(List<String> charList) {
  final reversedList = charList.reversed.toList();
  for (int index = 0; index < reversedList.length; index++) {
    final character = reversedList[index];

    if (int.tryParse(character) != null) {
      return int.parse(character);
    }
    switch (character) {
      case 't':
        if (reversedList[index + 1] == 'h' &&
            reversedList[index + 2] == 'g' &&
            reversedList[index + 3] == 'i' &&
            reversedList[index + 4] == 'e') {
          return 8;
        }
      case 'o':
        if (reversedList[index + 1] == 'w' && reversedList[index + 2] == 't') {
          return 2;
        }
      case 'e':
        if (reversedList[index + 1] == 'e' &&
            reversedList[index + 2] == 'r' &&
            reversedList[index + 3] == 'h' &&
            reversedList[index + 4] == 't') {
          return 3;
        }
        if (reversedList[index + 1] == 'n' && reversedList[index + 2] == 'o') {
          return 1;
        }
        if (reversedList[index + 1] == 'n' &&
            reversedList[index + 2] == 'i' &&
            reversedList[index + 3] == 'n') {
          return 9;
        }

        if (reversedList[index + 1] == 'v' &&
            reversedList[index + 2] == 'i' &&
            reversedList[index + 3] == 'f') {
          return 5;
        }
      case 'x':
        if (reversedList[index + 1] == 'i' && reversedList[index + 2] == 's') {
          return 6;
        }
      case 'n':
        if (reversedList[index + 1] == 'e' &&
            reversedList[index + 2] == 'v' &&
            reversedList[index + 3] == 'e' &&
            reversedList[index + 4] == 's') {
          return 7;
        }
      case 'r':
        if (reversedList[index + 1] == 'u' &&
            reversedList[index + 2] == 'o' &&
            reversedList[index + 3] == 'f') {
          return 4;
        }
    }
  }
  return 0;
}
