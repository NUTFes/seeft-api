class User {
  int id;
  String name;
  int bureauId;
  int gradeId;
  String createdAt;
  String updatedAt;
  String deletedAt;

  User(
    this.id,
    this.name,
    this.bureauId,
    this.gradeId, [
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt = '',
  ]);

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
