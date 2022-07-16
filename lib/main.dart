import 'package:hotreloader/hotreloader.dart';

import './di/di.dart';
import './config/config.dart';

void main() async {
  final Environment env = Environment();
  if (env.applicationEnv == 'production') {
    Log.setupProd();
  } else {
    Log.setupDev();
  }

  await HotReloader.create(onAfterReload: (ctx) => log.info('Hot-reload result: ${ctx.result}\n ${ctx.reloadReports}'));

  final server = await initializeServer(env);

  await server.run();
}
