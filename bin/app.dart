import '../internal/di/di.dart';
import '../internal/external/mysql/mysql.dart';

void main() async {
  final server = await initializeServer();

  await server.run();
  print(server.server.runtimeType);
}
