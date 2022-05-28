import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/usecase/repository/bureau_repository.dart';
import 'package:seeft_api/usecase/bureau_usecase.dart';
import 'package:seeft_api/entity/bureau.dart';

void main() {
  final usecase = BureauUsecaseImpl(BureauRepositoryTest());
  final context = Request('GET', Uri.parse('http://localhost:3000/bureaus')).context;

  test('bureau_usecase.getBureaus', () async {
    final bureaus = await usecase.getBureaus(context);
    final correct = await _createList();
    expect(jsonEncode(bureaus), jsonEncode(correct));
  });
}

class BureauRepositoryTest implements BureauRepository {
  @override
  Future<List<Bureau>> getBureaus(ctx) async {
    final list = await _createList();
    return list;
  }
}

_createList() async {
  return await Future<List<Bureau>>.value([
    Bureau(),
    Bureau(id: 23, bureau: 'hoge fuga'),
  ]);
}
