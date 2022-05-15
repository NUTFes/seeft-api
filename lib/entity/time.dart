class Time {
  int id;
  String time;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Time({
    this.id = 0,
    this.time = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> get toMap => {
        'id': id,
        'time': time,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'deleted': isDeleted,
      };
}
