import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../config/config.dart';
import '../../entity/entity.dart';
import '../../usecase/usecase.dart';

class TaskController {
  final StatusResponse statusResponse;
  final TaskUsecase taskUsecase;

  TaskController(
    this.statusResponse,
    this.taskUsecase,
  );

  getTasks(Request request) async {
    try {
      List<Task> tasks = await taskUsecase.getTasks(request.context);
      return statusResponse.responseOK(jsonEncode(tasks));
    } catch (e) {
      Log.severe('TaskController.getTasks: ${e.toString()}');
      var json = jsonEncode({'message': e.toString()});
      return statusResponse.responseBadRequest(json);
    }
  }
}
