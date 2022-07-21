class Year {
  int id;
  String year;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Year({
    this.id = 0,
    this.year = '',
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  })  : createdAt = createdAt ?? DateTime(0),
        updatedAt = updatedAt ?? DateTime(0);

  bool get isDeleted => deletedAt != null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'year': year,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
        'isDeleted': isDeleted,
      };
}
