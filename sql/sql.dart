import 'dart:io';
import 'package:args/args.dart';
import 'package:intl/intl.dart';

void main(List<String> args) async {
  print(args);
  var parser = ArgParser();

  // --mode abc でabcという値をとる
  //  parser.addOption('mode', abbr: 'm');

  // --mode でTrue
  // parser.addFlag('mode', abbr: 'm');

  // parser.Commandでmigrateと作成をわける
  var newCommand = parser.addCommand('new');
  newCommand.addOption('model', abbr: 'm');

  var migrateCommand = parser.addCommand('migrate');
  var results = parser.parse(args);

  if (results.command?.name == null) {
    exit(0);
  }

  if (results.command?.name == "new") {
    run(results.command?['model']);
  } else {
    print("Not Found Option.");
  }
}

run(name) {
  final DateTime now = DateTime.now();
  final DateFormat format = DateFormat('yyyyMMddHms');
  String time = format.format(now);
  String create = time + '_' + name + '.create.sql';
  String drop = time + '_' + name + '.drop.sql';

  final File createFile = new File(create);
//    final File dropFile = new File(drop);

  createFile.writeAsString('''
CREATE TABLE IF NOT EXISTS ${name} (
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
