import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/config.dart';
import '../../entity/entity.dart';
import '../../usecase/usecase.dart';

class AuthController {
  final StatusResponse statusResponse;
  final AuthUsecase authUsecase;

  AuthController(
    this.statusResponse,
    this.authUsecase,
  );

  signIn(Request request, String mail) async {
    try {
//      final body = await request.readAsString();
//      final params = jsonDecode(body);
//      if (params['mail'] == null) {
//        throw Exception('mail params does not exist');
//      }
      print(mail);

      User user = await authUsecase.signIn(request.context, User(mail: mail));
      return statusResponse.responseOK(jsonEncode(user));
    } catch (e) {
      Log.severe('AuthController.signIn: ${e.toString()}');
      var json = jsonEncode({'message': e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
