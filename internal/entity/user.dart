class User {
  int id;
  String name;
  int bureauId;
  int gradeId;
  String createdAt;
  String updatedAt;
  String deletedAt;

  User({
    this.id = 0,
    this.name = '',
    this.bureauId = 0,
    this.gradeId = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt = '',
  });

  bool get isDeleted => deletedAt != 'null';

  Map<String, dynamic> get toMap => {
        'id': id,
        'name': name,
        'bureauId': bureauId,
        'gradeId': gradeId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deleted': isDeleted
      };
}
