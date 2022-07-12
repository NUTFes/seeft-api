import 'package:hotreloader/hotreloader.dart';

import './di/di.dart';
import './config/config.dart';

void main() async {
  Log.setup();
  await HotReloader.create(onAfterReload: (ctx) => log.info('Hot-reload result: ${ctx.result}\n ${ctx.reloadReports}'));

  final server = await initializeServer();

  await server.run();
}
