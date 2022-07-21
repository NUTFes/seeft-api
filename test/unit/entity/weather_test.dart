import 'package:test/test.dart';

import 'package:seeft_api/entity/weather.dart';

void main() {
  final Weather testWeather = Weather(
    id: 1,
    weather: 'hoge',
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  test('create weather entity', () {
    final Weather weather = Weather();
    expect(weather.id, 0);
    expect(weather.weather, '');
    expect(weather.createdAt, DateTime(0));
    expect(weather.updatedAt, DateTime(0));
    expect(weather.deletedAt, null);

    expect(testWeather.id, 1);
    expect(testWeather.weather, 'hoge');
    expect(testWeather.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testWeather.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testWeather.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('weather.isDeleted', () {
    final Weather weather = Weather();
    expect(weather.isDeleted, false);
    expect(testWeather.isDeleted, true);
  });

  test('weather.toJson()', () {
    final Weather initialWeather = Weather();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'weather': '',
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialWeather.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'weather': 'hoge',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testWeather.toJson(), testMap);
  });
}
