import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class UserController {
  var statusResponse;
  var userUsecase;

  UserController(this.statusResponse, this.userUsecase);
  
  getUser(Request request, String id) async{
    try {
      User user = await userUsecase.getUser(request.context, int.parse(id));
      var json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
      
    } on Exception catch(e, st) {
      print(e);
      //      print(st);
      print(e.runtimeType);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    } on Error catch(e, st) {
      print(e.runtimeType);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);

    }
  }

  getUsers(Request request) async{
    try {
      List<User> users = await userUsecase.getUsers(request.context);

      List<Map> list = [];
      users.forEach((user) {
          list.add(user.toMap);
      });
      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
      
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      //      print(st);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }


  insertUser(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['name'] == null) {
        throw Exception('name params does not exist');
      }

      User user = await userUsecase.insertUser(request.context, params["name"]);

      var json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});      
      return statusResponse.responseBadRequest(json);
    }
  }

  updateUser(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['id'] == null) {
        throw Exception('id params does not exist');
      }
      
      if (params['name'] == null) {
        throw Exception('name params does not exist');
      }

      User user = await userUsecase.updateUser(request.context, User(params["id"], params["name"]));

      String json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }

  deleteUser(Request request, String id) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      User user = await userUsecase.deleteUser(request.context, User(int.parse(id), ""));

      Map map = {'success': user.isDeleted};
      String json = jsonEncode(map);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }

  getSessionByUserID(Request request, String id) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      List<Session> sessions = await userUsecase.getSessionByUserID(
        request.context,
        Session(
          0,
          "",
          "",
          int.parse(id)
        )
      );

      List<Map> list = [];
      sessions.forEach((session) {
          list.add(session.toMap);
      });

      String json = jsonEncode(list);
      return statusResponse.responseOK(json);
      //    } on Exception catch(e, st) {
    } catch(e, st) {
      print(e);
      var json = jsonEncode({"message": e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
