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

  var userCommand = parser.addCommand('user');
  userCommand.addOption('csv', defaultsTo: 'user.csv');

  var taskCommand = parser.addCommand('task');
  taskCommand.addOption('csv', defaultsTo: 'task.csv');

  var shiftCommand = parser.addCommand('shift');
  shiftCommand.addOption('csv', defaultsTo: 'shift.csv');
  shiftCommand.addOption('year', abbr: 'y', defaultsTo: '40');
  shiftCommand.addOption('date', abbr: 'd', allowed: ['pre', '1', '2']);
  shiftCommand.addOption('weather', abbr: 'w', allowed: ['sunny', 'rainy']);

  parser.addCommand('migrate');
  var results = parser.parse(args);

  if (results['help']) {
    var message = '''
Usage: dart sql.dart <command> [arguments]

Global options:
-h, --help   Print this usage information.

Available commands:
  seed       Database seeding `seed.sql`.
  migrate    Migrate SQL.
  new        Create migrated sql file.
  task       Create tasks sql file.
  shift      Create shifs sql file.

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
  } else if (results.command?.name == 'user') {
    user(results.command?['csv']);
  } else if (results.command?.name == 'task') {
    task(results.command?['csv']);
  } else if (results.command?.name == 'shift') {
    shift(
      csvFile: results.command?['csv'],
      year: results.command?['year'],
      date: results.command?['date'],
      weather: results.command?['weather'],
    );
  } else {
    print("Not Found Option.");
    exit(0);
  }
}

seed() async {
  Map<String, String> env = Platform.environment;
  final host = env['DATABASE_HOST'] ?? '';
  final user = env['DATABASE_USER'] ?? '';
  final password = env['DATABASE_PASSWORD'] ?? '';
  final name = env['DATABASE_NAME'] ?? '';

  final ConnectionSettings settings = ConnectionSettings(host: host, user: user, password: password, db: name);
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

user(csvFile) async {
  Map<String, String> env = Platform.environment;
  final host = env['DATABASE_HOST'] ?? '';
  final user = env['DATABASE_USER'] ?? '';
  final password = env['DATABASE_PASSWORD'] ?? '';
  final name = env['DATABASE_NAME'] ?? '';

  final ConnectionSettings settings = ConnectionSettings(host: host, user: user, password: password, db: name);
  var conn = await MySqlConnection.connect(settings);
  for (String line in await File(csvFile).readAsLines()) {
    List l = line.split(',').toList();
    if (l[0] == '番号') {
      continue;
    }

    String sql = '''
INSERT INTO users (`name`, `mail`, `bureau_id`, `grade_id`)
VALUES ('${l[4]}', '${l[8]}', ${_bureauId(l[1])}, ${_gradeId(l[3])});
''';
    await conn.query(sql);
  }
  exit(0);
}

task(csvFile) async {
  Map<String, String> env = Platform.environment;
  final host = env['DATABASE_HOST'] ?? '';
  final user = env['DATABASE_USER'] ?? '';
  final password = env['DATABASE_PASSWORD'] ?? '';
  final name = env['DATABASE_NAME'] ?? '';

  final ConnectionSettings settings = ConnectionSettings(host: host, user: user, password: password, db: name);
  var conn = await MySqlConnection.connect(settings);
  for (String line in await File(csvFile).readAsLines()) {
    List l = line.split(',').toList();
    if (l[0] == 'タスク名(シフト名)') {
      continue;
    }

    String sql = '''
INSERT INTO tasks (`task`, `color`, `place`, `url`, `superviser`, `notes`, `year_id`, `created_user_id`, `updated_user_id`)
VALUES ('${l[0]}', 'ffffff' , '1', '${l[1]}', '', '', 1, 1, 1);
''';
    await conn.query(sql);
  }
  print('tasks set.');
  exit(0);
}

shift({csvFile, year, date, weather}) async {
  final year_id = int.parse(year);

  // ToDo: 書き方直す
  var date_id;
  switch (date) {
    case 'pre':
      date_id = 1;
      break;
    case '1':
      date_id = 2;
      break;
    case '2':
      date_id = 3;
      break;
    default:
      date_id = 4;
      break;
  }

  var weather_id;
  switch (weather) {
    case 'sunny':
      weather_id = 1;
      break;
    case 'rainy':
      weather_id = 2;
      break;
    default:
      weather_id = 0;
      break;
  }

  Map<String, String> env = Platform.environment;
  final host = env['DATABASE_HOST'] ?? '';
  final user = env['DATABASE_USER'] ?? '';
  final password = env['DATABASE_PASSWORD'] ?? '';
  final name = env['DATABASE_NAME'] ?? '';

  final ConnectionSettings settings = ConnectionSettings(host: host, user: user, password: password, db: name);
  var conn = await MySqlConnection.connect(settings);

//  var tasks = await conn.query('SELECT * FROM tasks');
//  var users = await conn.query('SELECT * FROM users');
//  var grades = await conn.query('SELECT * FROM grades');
//  var times = await conn.query('SELECT * FROM times');

  final List list = [];
  for (String line in await File(csvFile).readAsLines()) {
    List l = line.split(',').toList();
    list.add(l);
  }

  // timesはnearly equal x-4
  final times = await conn.query('SELECT id, time FROM times;');

  for (var y = 3; y < list[0].length; y++) {
    print('${list[3][y]}');
    for (var x = 4; x < list.length; x++) {
      if (list[x][0] == '22:00') break;
      final u = await conn.query('SELECT id FROM users WHERE name = "${list[3][y]}"');
      if (u.isEmpty) {
        continue;
      }
      final user_id = u.first.fields['id'];
      final t = await conn.query('SELECT id FROM tasks WHERE task = "${list[x][y]}"');
      var task_id;
      if (t.isEmpty) {
        task_id = 4;
      } else {
        task_id = t.first.fields['id'];
      }
      await conn.query('''
INSERT INTO shifts
(user_id, task_id, year_id, date_id, time_id, weather_id, created_user_id, updated_user_id)
VALUES
($user_id, $task_id, $year_id, $date_id, ${x - 3}, $weather_id, 1, 1);
          ''');
    }
  }

  print('shifts set.');
  exit(0);
}

_bureauId(String bureau) {
  switch (bureau) {
    case '委員長':
      return 1;
    case '副委員長':
      return 2;
    case '総務局':
      return 3;
    case '企画局':
      return 4;
    case '渉外局':
      return 5;
    case '財務局':
      return 6;
    case '制作局':
      return 7;
    case '情報局':
      return 8;
    default:
      return 0;
  }
}

_gradeId(String grade) {
  switch (grade) {
    case 'B1':
      return 1;
    case 'B2':
      return 2;
    case 'B3':
      return 3;
    case 'B4':
      return 4;
    case 'M1':
      return 5;
    case 'M2':
      return 6;
    case 'D1':
      return 7;
    case 'D2':
      return 8;
    case 'OB':
      return 9;
    default:
      return 0;
  }
}
