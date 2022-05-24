import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/controller/bureau_controller.dart';
import 'package:seeft_api/usecase/bureau_usecase.dart';
import 'package:seeft_api/entity/bureau.dart';
import 'package:seeft_api/config/http_status.dart';

void main() {
  final controller = BureauController(StatusResponse(), BureauUsecaseTest());

  test('bureau_controller.getBureaus', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/bureaus'));
    final bureaus = await controller.getBureaus(request);
    final correct = await _createList();
    expect(bureaus.readAsString(), completion(jsonEncode(correct)));
  });
}

class BureauUsecaseTest implements BureauUsecase {
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
