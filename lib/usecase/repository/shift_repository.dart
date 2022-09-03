import '../../entity/entity.dart';

abstract class ShiftRepository {
  Future<List<Shift>> getShiftsByUser(ctx, User req);
  Future<List<Shift>> getShiftsByUserAndDateAndWeather(ctx, Shift req);
  Future<List<Shift>> getShiftsByYear(ctx, User req);
  Future<List<Shift>> getShiftsByDate(ctx, Shift req);
}
