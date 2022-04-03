class User {
  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;

  User(
    this.id,
    this.name,
    [
      this.createdAt = '',
      this.updatedAt = '',
      this.deletedAt = '',
    ]
  );

  bool get isDeleted => deletedAt != 'null';

  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

}
