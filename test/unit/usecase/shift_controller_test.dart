import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/usecase/repository/shift_repository.dart';
import 'package:seeft_api/usecase/shift_usecase.dart';
import 'package:seeft_api/entity/entity.dart';

void main() {
  final usecase = ShiftUsecaseImpl(ShiftRepositoryTest());
  final context = Request('GET', Uri.parse('http://localhost:3000/shifts')).context;

  test('shift_usecase.getShifts', () async {
    final shifts = await usecase.getShiftsByUser(context, User(id: 1));
    final correct = await _createList();
    expect(jsonEncode(shifts), jsonEncode(correct));
  });

  test('shift_usecase.getShiftsByUserAndDateAndWeather', () async {
    final shifts = await usecase.getShiftsByUserAndDateAndWeather(context, Shift(id: 1));
    final correct = await _createList();
    expect(jsonEncode(shifts), jsonEncode(correct));
  });
}

class ShiftRepositoryTest implements ShiftRepository {
  @override
  Future<Shift> getShift(ctx, Shift req) async {
    return Shift();
  }
  
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
}

_createList() async {
  return await Future<List<Shift>>.value([
    Shift(),
    Shift(id: 23),
  ]);
}
