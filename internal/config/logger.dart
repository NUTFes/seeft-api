import 'package:logging/logging.dart';

final log = Logger('SeeFT-API-Logger');

loggerSetup() {
  Logger.root.level = Level.CONFIG;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
