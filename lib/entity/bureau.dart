import './color.dart';

class Bureau {
  int id;
  String bureau;
  Color color;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Bureau({
    this.id = 0,
    this.bureau = '',
    this.color = const Color(0xFFFAFA),
    this.createdAt = '',
    this.updatedAt = '',
    this.deletedAt = '',
  });

  bool get isDeleted => deletedAt != 'null';

  Map<String, dynamic> toJson() => {
        'id': id,
        'bureau': bureau,
        'color': color.toString(),
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deleted': isDeleted,
      };
}
