import './entity.dart';

class Task {
  int id;
  String task;
  Color color;
  String place;
  String url;
  String superviser;
  String notes;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Task({
    this.id = 0,
    this.task = '',
    this.color = const Color(0xFFFAFA),
    this.place = '',
    this.url = '',
    this.superviser = '',
    this.notes = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'task': task,
        'color': color.toString(),
        'place': place,
        'url': url,
        'superviser': superviser,
        'notes': notes,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted,
      };
}
