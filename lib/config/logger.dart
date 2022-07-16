import 'package:logging/logging.dart';

final log = Logger('SeeFT-API-Logger');

class Log {
  static setupDev() {
    Logger.root.level = Level.CONFIG;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  static setupProd() {
    Logger.root.level = Level.WARNING;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  static severe(dynamic text) {
    log.severe(text);
  }

  static warning(dynamic text) {
    log.warning(text);
  }

  static info(dynamic text) {
    log.info(text);
  }

  static config(dynamic text) {
    log.config(text);
  }
}
