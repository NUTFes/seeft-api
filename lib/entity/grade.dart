class Grade {
  int id;
  String grade;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Grade({
    this.id = 0,
    this.grade = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'grade': grade,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted,
      };
}
