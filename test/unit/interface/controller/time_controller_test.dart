import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/controller/time_controller.dart';
import 'package:seeft_api/usecase/time_usecase.dart';
import 'package:seeft_api/entity/time.dart';
import 'package:seeft_api/config/http_status.dart';

void main() {
  final controller = TimeController(StatusResponse(), TimeUsecaseTest());

  test('time_controller.getTimes', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/times'));
    final times = await controller.getTimes(request);
    final correct = await _createList();
    expect(times.readAsString(), completion(jsonEncode(correct)));
  });
}

class TimeUsecaseTest implements TimeUsecase {
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
