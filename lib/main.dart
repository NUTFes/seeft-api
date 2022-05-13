import 'package:hotreloader/hotreloader.dart';

import './di/di.dart';
import './config/logger.dart';

void main() async {
  Log.setup();
  final reloader = await HotReloader.create(
      onAfterReload: (ctx) => log.info('Hot-reload result: ${ctx.result}\n ${ctx.reloadReports}'));

  final server = await initializeServer();

  await server.run();
}
