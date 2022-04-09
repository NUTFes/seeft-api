class Time {
  int id;
  String time;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Time(
    this.id,
    this.time, [
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt = '',
  ]);

  bool get isDeleted => deletedAt != 'null';

  Map<String, dynamic> get toMap => {
        'id': id,
        'time': time,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deleted': isDeleted,
      };
}
