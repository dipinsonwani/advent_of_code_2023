import 'dart:io';

import 'package:advent_of_code_2023/day2/shared.dart';

void main() {
  final input = File('inputs/day2.txt').readAsLinesSync();
  final list = convertToMap(input);

  int redMax = 0, blueMax = 0, greenMax = 0;

  int sum = 0;

  for (var i = 0; i < list.length; i++) {
    final rgbList = list[i].values.toList()[0];
    for (var j = 0; j < rgbList.length; j++) {
      if (rgbList[j]['r'] > redMax) {
        redMax = rgbList[j]['r'];
      }
      if (rgbList[j]['g'] > greenMax) {
        greenMax = rgbList[j]['g'];
      }
      if (rgbList[j]['b'] > blueMax) {
        blueMax = rgbList[j]['b'];
      }
    }
    sum = sum + (redMax * blueMax * greenMax);
    redMax = blueMax = greenMax = 0;
  }
  print(sum);
}
