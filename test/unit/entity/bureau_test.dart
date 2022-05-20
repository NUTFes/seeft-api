import 'package:test/test.dart';

import 'package:seeft_api/entity/bureau.dart';
import 'package:seeft_api/entity/color.dart';

void main() {
  final Bureau testBureau = Bureau(
    id: 1,
    bureau: 'hoge',
    color: Color(0x000000),
    createdAt: DateTime.parse('1998-10-23 04:35:22'),
    updatedAt: DateTime.parse('2002-10-23 06:44:11'),
    deletedAt: DateTime.parse('2019-01-01 00:00:00'),
  );

  /*
  ToDo: colorの比較をtoString()でやるのダサいのでやめたい
        Objectの比較になっているとダメなのでequatableとか導入してtestコード減らしてもいいかも
  */
  test('create bureau entity', () {
    final Bureau bureau = Bureau();
    expect(bureau.id, 0);
    expect(bureau.bureau, '');
    expect(bureau.color.toString(), Color(0xFFFAFA).toString());
    expect(bureau.createdAt, DateTime(0));
    expect(bureau.updatedAt, DateTime(0));
    expect(bureau.deletedAt, null);

    expect(testBureau.id, 1);
    expect(testBureau.bureau, 'hoge');
    expect(testBureau.color.toString(), Color(0x000000).toString());
    expect(testBureau.createdAt, DateTime.parse('1998-10-23 04:35:22'));
    expect(testBureau.updatedAt, DateTime.parse('2002-10-23 06:44:11'));
    expect(testBureau.deletedAt, DateTime.parse('2019-01-01 00:00:00'));
  });

  test('bureau.isDeleted', () {
    final Bureau bureau = Bureau();
    expect(bureau.isDeleted, false);
    expect(testBureau.isDeleted, true);
  });

  test('bureau.toJson()', () {
    final Bureau initialBureau = Bureau();
    const Map<String, dynamic> initialMap = {
      'id': 0,
      'bureau': '',
      'color': '0xfffafa',
      'createdAt': '0000-01-01 00:00:00.000',
      'updatedAt': '0000-01-01 00:00:00.000',
      'isDeleted': false,
    };
    expect(initialBureau.toJson(), initialMap);

    const Map<String, dynamic> testMap = {
      'id': 1,
      'bureau': 'hoge',
      'color': '0x000000',
      'createdAt': '1998-10-23 04:35:22.000',
      'updatedAt': '2002-10-23 06:44:11.000',
      'isDeleted': true,
    };
    expect(testBureau.toJson(), testMap);
  });
}
