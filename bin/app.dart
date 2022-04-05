import '../internal/di/di.dart';

void main() async {
  final server = await initializeServer();

  await server.run();
  print(server.server.runtimeType);
}
