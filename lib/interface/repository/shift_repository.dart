import '../../usecase/repository/shift_repository.dart';
import '../../entity/entity.dart';
import './external/database.dart';

class ShiftRepositoryImpl implements ShiftRepository {
  Database database;

  ShiftRepositoryImpl(this.database);

  @override
  Future<List<Shift>> getShiftsByUser(ctx, User req) async {
    String sql = '''
SELECT
  shifts.id,
  shifts.user_id,
  users.name as user_name,
  users.bureau_id as user_bureau_id,
  users.grade_id as user_grade_id,
  users.created_at as user_created_at,
  users.updated_at as user_updated_at,
  users.deleted_at as user_deleted_at,
  shifts.task_id,
  tasks.task as task_name,
  tasks.color as task_color,
  tasks.place as task_place,
  tasks.url as task_url,
  tasks.superviser as task_superviser,
  tasks.notes as task_notes,
  tasks.created_at as task_created_at,
  tasks.updated_at as task_updated_at,
  tasks.deleted_at as task_deleted_at,
  shifts.year_id,
  shifts.date_id,
  shifts.time_id,
  shifts.weather_id,
  shifts.is_attendance,
  shifts.created_user_id,
  shifts.updated_user_id,
  shifts.created_at as shift_created_at,
  shifts.updated_at as shift_updated_at,
  shifts.deleted_at as shift_deleted_at
FROM shifts
LEFT JOIN users ON shifts.user_id = users.id
LEFT JOIN tasks ON shifts.task_id = tasks.id
LEFT JOIN years ON shifts.year_id = years.id
LEFT JOIN dates ON shifts.date_id = dates.id
LEFT JOIN times ON shifts.time_id = times.id
LEFT JOIN weathers ON shifts.weather_id = weathers.id;
''';

    List<Map<String, dynamic>> data = await database.finds(ctx, sql);
    List<Shift> list = [];

    for (var d in data) {
      Shift shift = Shift(
        id: d['id'],
        user: User(
          id: d['user_id'],
          name: d['user_name'],
          bureauId: d['user_bureau_id'],
          gradeId: d['user_grade_id'],
          createdAt: d['user_created_at'],
          updatedAt: d['user_updated_at'],
          deletedAt: d['user_deleted_at'],
        ),
        task: Task(
          id: d['task_id'],
          task: d['task_name'],
          color: Color(int.parse(d['task_color'], radix: 16)),
          place: d['task_place'],
          url: d['task_url'],
          superviser: d['task_superviser'],
          notes: d['task_notes'].toString(),
          createdAt: d['task_created_at'],
          updatedAt: d['task_updated_at'],
          deletedAt: d['task_deleted_at'],
        ),
        year: Year(
          id: d['year_id'],
        ),
        date: Date(
          id: d['date_id'],
        ),
        time: Time(
          id: d['time_id'],
        ),
        weather: Weather(
          id: d['weather_id'],
        ),
        isAttendance: d['is_attendance'] == 1,
        createdUserId: d['created_user_id'],
        updatedUserId: d['updated_user_id'],
        createdAt: d['created_at'],
        updatedAt: d['updated_at'],
        deletedAt: d['deleted_at'],
      );

      if (shift.isDeleted) {
        continue;
      }

      list.add(shift);
    }

    return list;
  }
}
