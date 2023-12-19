import 'dart:io';

import 'package:advent_of_code_2023/day2/shared.dart';

void main() {
  final input = File('inputs/day2.txt').readAsLinesSync();
  final list = convertToMap(input);
  // print(list);
  final resultList = [...list];
  int redMax = 12;
  int blueMax = 14;
  int greenMax = 13;
  int sum = 0;
  for (var i = 0; i < list.length; i++) {
    // print('List of length ${list.length}');
    final rgbList = list[i].values.toList()[0];
    print(rgbList);
    for (var j = 0; j < rgbList.length; j++) {
      // print('J iteration $j');
      if (rgbList[j]['r'] > redMax ||
          rgbList[j]['g'] > greenMax ||
          rgbList[j]['b'] > blueMax) {
        // print('This item is being removed ${list[i]}');
        resultList.remove(list[i]);
        break;
      }
    }
    ;
  }
  print(resultList);

  for (var element in resultList) {
    print(element.keys.first);
    sum = sum + int.parse(element.keys.first);
  }
  print(sum);
}
