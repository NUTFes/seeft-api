import 'package:hotreloader/hotreloader.dart';

import '../internal/di/di.dart';
import '../internal/config/logger.dart';

void main() async {
  Log.setup();
  final reloader = await HotReloader.create(
      onAfterReload: (ctx) => log.info('Hot-reload result: ${ctx.result}\n ${ctx.reloadReports}'));

  final server = await initializeServer();

  await server.run();
  Log.info(server.server.runtimeType);
}
