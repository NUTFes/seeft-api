class User {
  final int id;
  final String name;
  final int bureauId;
  final int gradeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  User({
    this.id = 0,
    this.name = '',
    this.bureauId = 0,
    this.gradeId = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> get toMap => {
        'id': id,
        'name': name,
        'bureauId': bureauId,
        'gradeId': gradeId,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted
      };
}
