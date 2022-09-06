import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/controller/shift_controller.dart';
import 'package:seeft_api/usecase/usecase.dart';
import 'package:seeft_api/entity/entity.dart';
import 'package:seeft_api/config/http_status.dart';

void main() {
  final controller = ShiftController(StatusResponse(), ShiftUsecaseTest());

  test('shift_controller.getShifts', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/shifts/users/1'));
    final shifts = await controller.getShiftsByUser(request, "1");
    final correct = await _createList();
    expect(shifts.readAsString(), completion(jsonEncode(correct)));
  });

  test('shift_controller.getShiftsbyUserAndDateAndWeather', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/shifts/users/1/dates/2/weathers/3'));
    final shifts = await controller.getShiftsByUserAndDateAndWeather(request, "1", "2", "3");
    final correct = await _createList();
    expect(shifts.readAsString(), completion(jsonEncode(correct)));
  });

  test('shift_controller.getShiftsByYearAndDateAndWeather', () async {
    var request = Request('GET', Uri.parse('http://localhost:3000/shifts/users/1'));
    final shifts = await controller.getShiftsByYearAndDateAndWeather(request, "1");
    final correct = await _createList();
    expect(shifts.readAsString(), completion(jsonEncode(correct)));
  });
}

class ShiftUsecaseTest implements ShiftUsecase {
  @override
  Future<List<Shift>> getShiftsByUser(ctx, User req) async {
    final list = await _createList();
    return list;
  }

  @override
  Future<List<Shift>> getShiftsByUserAndDateAndWeather(ctx, Shift req) async {
    final list = await _createList();
    return list;
  }

  @override
  Future<List<Shift>> getShiftsByYear(ctx, Shift req) async {
    List<Shift> list = await shiftRepository.getShiftsByYear(ctx, req);
    return list;
  }

  @override
  Future<List<Shift>> getShiftsByDate(ctx, Shift req) async {
    List<Shift> list = await shiftRepository.getShiftsByDate(ctx, req);
    return list;
  }
}

_createList() async {
  return await Future<List<Shift>>.value([
    Shift(),
    Shift(id: 23),
  ]);
}
