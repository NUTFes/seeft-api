import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/export.dart';
import '../../entity/export.dart';
import '../../usecase/user_usecase.dart';

class UserController {
  StatusResponse statusResponse;
  UserUsecase userUsecase;

  UserController(this.statusResponse, this.userUsecase,);

  getUser(Request request, String id) async {
    try {
      User user = await userUsecase.getUser(request.context, int.parse(id));

      if (user.isDeleted) {
        throw Exception('this user is deleted.');
      }

      var json = jsonEncode(user.toMap);

      return statusResponse.responseOK(json);
    } on Exception catch (e) {
      Log.severe('userContoller.getUser: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

      return statusResponse.responseBadRequest(json);
    } on Error catch (e) {
      Log.severe('userContoller.getUser: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

      return statusResponse.responseBadRequest(json);
    }
  }

  getUsers(Request request) async {
    try {
      List<User> users = await userUsecase.getUsers(request.context);

      List<Map> list = [];
      for (var user in users) {
        list.add(user.toMap);
      }
    
      var json = jsonEncode(list);
      return statusResponse.responseOK(json);

    } catch (e) {
      Log.severe('userContoller.getUsers: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

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

      if (params['bureauId'] == null) {
        throw Exception('bureauId params does not exits.');
      }

      if (params['gradeId'] == null) {
        throw Exception('gradeId params does not exist.');
      }

      final User user = await userUsecase.insertUser(
        request.context,
        User(
          name: params['name'],
          bureauId: params['bureauId'],
          gradeId: params['gradeId'],
        ),
      );

      final json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
    } catch (e) {
      Log.severe('userContoller.insertUser: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

      return statusResponse.responseBadRequest(json);
    }
  }

  updateUser(Request request, String id) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['id'] == null) {
        throw Exception('id params does not exist.');
      }

      if (params['name'] == null) {
        throw Exception('name params does not exist.');
      }

      if (params['id'] != int.parse(id)) {
        throw Exception('id params is invalid.');
      }

      User user = await userUsecase.updateUser(
        request.context,
        User(
          id: params['id'],
          name: params['name'],
          bureauId: params['bureauId'],
          gradeId: params['gradeId'],
        ),
      );

      String json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
    } catch (e) {
      Log.severe('userContoller.updateUser: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

      return statusResponse.responseBadRequest(json);
    }
  }

  deleteUser(Request request, String id) async {
    try {
      User user = await userUsecase.deleteUser(request.context, User(id: int.parse(id)));

      Map map = {'success': user.isDeleted};
      String json = jsonEncode(map);

      return statusResponse.responseOK(json);
    } catch (e) {
      Log.severe('userContoller.delete: ' + e.toString());
      var json = jsonEncode({'message': e.toString()});

      return statusResponse.responseBadRequest(json);
    }
  }
}
