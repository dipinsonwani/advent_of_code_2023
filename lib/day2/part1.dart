import 'dart:io';

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

List<Map<String, dynamic>> convertToMap(List<String> input) {
  List<Map<String, dynamic>> gameList = [];
  for (int j = 0; j < input.length; j++) {
    var element = input[j];
    List<Map<String, dynamic>> rgbList = [];
    final list = element.substring(7).replaceAll(',', '').split('\n');
    // print(list);

    for (var element in list) {
      final rgb = element.replaceAll(' ', '').split('');
      rgb.add(';');
      int? red;
      int? blue;
      int? green;
// [3, b, l, u, e, 4, r, e, d, ;, 1, r, e, d, 2, g, r, e, e, n, 6, b, l, u, e, ;, 2, g, r, e, e, n]
      for (int i = 0; i < rgb.length; i++) {
        var element = rgb[i];

        if (int.tryParse(element) != null) {
          int value;
          if (int.tryParse(rgb[i + 1]) != null) {
            value = int.parse('$element${rgb[i + 1]}');
            ++i;
          } else {
            value = int.parse(element);
          }

          switch (rgb[i + 1]) {
            case 'r':
              red = value;
              break;
            case 'g':
              green = value;
              break;
            case 'b':
              blue = value;
              break;
          }
        }

        if (element == ';') {
          rgbList.add({'r': red ?? 0, 'b': blue ?? 0, 'g': green ?? 0});
          red = blue = green = 0;
        }
      }
      gameList.add({'${j + 1}': rgbList});
    }
  }
  return gameList;
}
