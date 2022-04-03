class Session {
  int id;
  String title;
  String description;
  int userID;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Session(
    this.id,
    this.title,
    this.description,
    this.userID,
    [
      this.createdAt = '',
      this.updatedAt = '',
      this.deletedAt = '',
    ]
  );

  bool get isDeleted => deletedAt != 'null';

  Map get toMap => {
    'id': id,
    'title': title,
    'description': description,
    'user_id': userID,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

}
