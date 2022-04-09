class Bureau {
  int id;
  String bureau;
  String color;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Bureau(
    this.id,
    this.bureau,
    this.color, [
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt = '',
  ]);

  bool get isDeleted => deletedAt != 'null';

  Map<String, dynamic> get toMap => {
        'id': id,
        'bureau': bureau,
        'color': color,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deleted': isDeleted,
      };
}
