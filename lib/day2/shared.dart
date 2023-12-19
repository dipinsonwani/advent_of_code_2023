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
