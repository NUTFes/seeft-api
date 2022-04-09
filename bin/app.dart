import 'package:hotreloader/hotreloader.dart';

import '../internal/di/di.dart';
import '../internal/config/logger.dart';

void main() async {
  loggerSetup();
  final reloader = await HotReloader.create(
      onBeforeReload: (ctx) => ctx.event?.path.contains('/myapp/lib/') ?? true,
      onAfterReload: (ctx) => print('Hot-reload result: ${ctx.result}'));

  final server = await initializeServer();

  await server.run();
  log.warning(server.server.runtimeType);
}
