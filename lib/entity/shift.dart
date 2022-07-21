class Shift {
  int id;
  int userId;
  int taskId;
  int yearId;
  int dateId;
  int timeId;
  int weatherId;
  bool isAttendance;
  int createdUserId;
  int updatedUserId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Shift({
    this.id = 0,
    this.userId = 0,
    this.taskId = 0,
    this.yearId = 0,
    this.dateId = 0,
    this.timeId = 0,
    this.weatherId = 0,
    this.isAttendance = false,
    this.createdUserId = 0,
    this.updatedUserId = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'taskId': taskId,
        'yearId': yearId,
        'dateId': dateId,
        'timeId': timeId,
        'weatherId': weatherId,
        'isAttendance': isAttendance,
        'createdUserId': createdUserId,
        'updatedUserId': updatedUserId,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted,
      };
}
