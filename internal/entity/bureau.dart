import './color.dart';

class Bureau {
  int id;
  String bureau;
  Color color;
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
        'color': color.toString(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deleted': isDeleted,
      };
}
