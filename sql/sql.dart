import 'dart:io';
import 'package:args/args.dart';
import 'package:intl/intl.dart';
import 'package:mysql1/mysql1.dart';

void main(List<String> args) async {
  var parser = ArgParser();

  // --mode abc でabcという値をとる
  //  parser.addOption('mode', abbr: 'm');

  // --mode でTrue
  // parser.addFlag('mode', abbr: 'm');

  // parser.Commandでmigrateと作成をわける

  /*
これから増えるはず
  var seedCommand = parser.addCommand('seed');
  */
  parser.addFlag('help', abbr: 'h', defaultsTo: false);
  parser.addCommand('seed');
  var newCommand = parser.addCommand('new');
  newCommand.addOption('model', abbr: 'm', defaultsTo: 'test');

  parser.addCommand('migrate');
  var results = parser.parse(args);

  if (results['help']){
    var message = '''
Usage: dart sql.dart <command> [arguments]

Global options:
-h, --help   Print this usage information.

Available commands:
  seed       Database seeding `seed.sql`.
  migrate    Migrate SQL.
  new        Create migrated sql file.

New command options:
-m, --model <NAME>   Table name.
''';
    print(message);
    exit(0);
  } 

  if (results.command?.name == "new") {
    run(results.command?['model']);
  } else if (results.command?.name == 'seed') {
    seed();
  } else {
    print("Not Found Option.");
    exit(0);
  }
}

seed() async {
  final ConnectionSettings settings = ConnectionSettings(host: 'db', user: 'mysql', password: 'pwd', db: 'seeft');
  var conn = await MySqlConnection.connect(settings);

  String file = await File('/myapp/sql/seed.sql').readAsString();
  List<String> sqls = file.split(';');
  sqls.removeLast();

  for (var sql in sqls) {
    await conn.query('$sql;');
  }
  await conn.close();
  print('finish');
}

run(name) {
  final DateTime now = DateTime.now();
  final DateFormat format = DateFormat('yyyyMMddHms');
  String time = format.format(now);
  String create = '${time}_$name.create.sql';
//  String drop = time + '_' + name + '.drop.sql';

  final File createFile = File(create);
//    final File dropFile = new File(drop);

  createFile.writeAsString('''
CREATE TABLE IF NOT EXISTS $name (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  deleted_at DATETIME
);
''');
//    dropFile.writeAsString('DROP TABLE IF EXISTS ' + name + ';');

  print(create);
//    print(drop);
}
