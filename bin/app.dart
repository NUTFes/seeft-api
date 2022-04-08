import 'package:shelf_hotreload/shelf_hotreload.dart';

import '../internal/di/di.dart';

void main() async {
  final server = await initializeServer();

  //  withHotreload( () => server.run());
  await server.run();
  print(server.server.runtimeType);
}
