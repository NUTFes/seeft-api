import 'package:hotreloader/hotreloader.dart';

import '../internal/di/di.dart';
import '../internal/config/logger.dart';

void main() async {
  loggerSetup();
  final reloader = await HotReloader.create(
      onAfterReload: (ctx) => log.info('Hot-reload result: ${ctx.result}\n ${ctx.reloadReports}'));

  final server = await initializeServer();

  await server.run();
  log.info(server.server.runtimeType);
}
