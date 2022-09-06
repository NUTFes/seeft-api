class TaskDetail {
  int id;
  String task;
  String place;
  String url;
  String superviser;
  String notes;
  int yearId;
  String users;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  TaskDetail({
    this.id = 0,
    this.task = '',
    this.place = '',
    this.url = '',
    this.superviser = '',
    String? notes,
    this.yearId = 0,
    String? users,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : notes = notes ?? '',
        users = users ?? '',
        createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'task': task,
        'place': place,
        'url': url,
        'superviser': superviser,
        'notes': notes,
        'users': users,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted,
      };
}
