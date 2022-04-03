import '../entity/export.dart';
import './repository/session_repository.dart';

class SessionUsecase {
  SessionRepository sessionRepository;
  
  SessionUsecase(this.sessionRepository);

  Future<List<Session>> getSessions(ctx) async {
    List<Session> sessions = await sessionRepository.getSessions(ctx);
    print(sessions);
    return sessions;
  }
  
  Future<Session> getSession(ctx, int id) async {
    Session session = await sessionRepository.getSession(ctx, id);
    return session;
  }

  Future<Session> insertSession(ctx, Session req) async {
    Session session = await sessionRepository.insertSession(ctx, req);
    return session;
  }

  Future<Session> updateSession(ctx, Session req) async {
    Session test = await sessionRepository.getSession(ctx, req.id);
    if (req.title == test.title && req.description == test.description) {
      throw Exception('request title or description are same.');
    }
    Session session = await sessionRepository.updateSession(ctx, req);

    if (test.updatedAt == session.updatedAt) {
      throw Exception('cant updated');
    }
    return session;
  }

  Future<Session> deleteSession(ctx, Session req) async {
    Session session = await sessionRepository.deleteSession(ctx, req);
    return session;
  }

  Future<List<Session>> getSessionByUserID(ctx, Session req) async {
    List<Session> sessions = await sessionRepository.getSessionByUserID(
      ctx,
      req
    );
    return sessions;
  }
}
