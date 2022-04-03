import '../../usecase/repository/session_repository.dart';
import './external/database.dart';
import '../../entity/export.dart';

class SessionRepositoryImpl implements SessionRepository {

  Database database;
  
  SessionRepositoryImpl(this.database);

  Future<List<Session>> getSessions(ctx) async {
    String sql = '''
SELECT * FROM sessions WHERE deleted_at IS NULL;
''';

    List<Map<String, dynamic>> data = await database.get(ctx, sql);
    List<Session> list = [];

    data.forEach((d) {
        list.add(
          Session(
            d['id'],
            d['title'],
            d['description'].toString(),
            d['user_id'],
            d['created_at'].toString(),
            d['updated_at'].toString(),
            d['deleted_at'].toString(),
          ),
        );
    });

    return list;
  }
  
  Future<Session> getSession(ctx, id) async {
    String sql = '''
SELECT
  *
FROM
  sessions
WHERE
  id=${id}
AND
  deleted_at IS NULL;
''';
    var data = await database.single(ctx, sql);

    Session session = Session(
      data['id'],
      data['title'],
      data['description'].toString(),
      data['user_id'],
      data['created_at'].toString(),
      data['updated_at'].toString(),
      data['deleted_at'].toString()
    );
    return session;
  }

  Future<Session> insertSession(ctx, Session req) async {
    String sql = '''
INSERT
INTO sessions (
  title,
  description, 
  user_id
)
VALUES (
  "${req.title}",
  "${req.description}",
  ${req.userID}
)
returning *;
''';

    var data = await database.insert(ctx, sql);
    if (data['id'] == 0) {
      print("error at SessionRepository.insertSession");
    }

    print(data);

    Session session = Session(
      data['id'],
      data['title'],
      data['description'].toString(),
      data['user_id'],
      data['created_at'].toString(),
      data['updated_at'].toString(),
      data['deleted_at'].toString()
    );

    print(session.toMap);
    return session;
  }

  Future<Session> updateSession(ctx, session) async {

    String sql = '''
UPDATE
  sessions
SET
  title="${session.title}",
  description="${session.description}"
WHERE
  id=${session.id};
''';
    String returningSQL = '''
SELECT * FROM sessions WHERE id=${session.id};
''';

    var data = await database.update(ctx, sql, returningSQL);
    Session resultSession = Session(
      data["id"],
      data["title"],
      data['description'].toString(),
      data['user_id'],

      data["created_at"].toString(),
      data["updated_at"].toString(),
      data["deleted_at"].toString()
    );
    return resultSession;
  }

  Future<Session> deleteSession(ctx, session) async {
    String sql = '''
UPDATE
  sessions
SET
  deleted_at=NOW()
WHERE
  id=${session.id};
''';
    String returningSQL = '''
SELECT * FROM sessions WHERE id=${session.id};
''';

    var data = await database.update(ctx, sql, returningSQL);
    Session resultSession = Session(
      data["id"],
      data["title"],
      data['description'].toString(),
      data['user_id'],
      data["created_at"].toString(),
      data["updated_at"].toString(),
      data["deleted_at"].toString()
    );
    return resultSession;
  }

  Future<List<Session>> getSessionByUserID(ctx, session) async {
    String sql = '''
SELECT
  *
FROM 
  sessions
WHERE
  deleted_at IS NULL
AND
  user_id=${session.userID};
''';

    List<Map<String, dynamic>> data = await database.get(ctx, sql);
    List<Session> list = [];

    data.forEach((d) {
        list.add(
          Session(
            d['id'],
            d['title'],
            d['description'].toString(),
            d['user_id'],
            d['created_at'].toString(),
            d['updated_at'].toString(),
            d['deleted_at'].toString(),
          ),
        );
    });

    return list;
  }

}
