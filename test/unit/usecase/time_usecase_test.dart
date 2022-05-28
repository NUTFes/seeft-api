import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/usecase/repository/time_repository.dart';
import 'package:seeft_api/usecase/time_usecase.dart';
import 'package:seeft_api/entity/time.dart';
import 'package:seeft_api/config/http_status.dart';

void main() {
  final usecase = TimeUsecaseImpl(TimeRepositoryTest());
  final context = Request('GET', Uri.parse('http://localhost:3000/times')).context;

  test('time_usecase.getTimes', () async {
    final times = await usecase.getTimes(context);
    final correct = await _createList();
    expect(jsonEncode(times), jsonEncode(correct));
  });
}

class TimeRepositoryTest implements TimeRepository {
  @override
  Future<List<Time>> getTimes(ctx) async {
    final list = await _createList();
    return list;
  }
}

_createList() async {
  return await Future<List<Time>>.value([
    Time(),
    Time(id: 1, time: '10:00'),
  ]);
}
