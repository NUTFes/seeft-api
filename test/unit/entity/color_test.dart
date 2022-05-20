import 'package:test/test.dart';

import 'package:seeft_api/entity/color.dart';

void main() {
  final Color hexColor = Color(0x000000);
  final Color rgbColor = Color.fromRGB(25, 25, 25);

  test('color value', () {
    expect(hexColor.value, 0x000000);
    expect(rgbColor.value, 0x191919);
  });
  test('get rgb value in color entity', () {
    expect(hexColor.red, 0);
    expect(hexColor.green, 0);
    expect(hexColor.blue, 0);

    expect(rgbColor.red, 25);
    expect(rgbColor.green, 25);
    expect(rgbColor.blue, 25);
  });

  test('color.toString()', () {
    expect(hexColor.toString(), '0x000000');
    expect(rgbColor.toString(), '0x191919');
  });
}
