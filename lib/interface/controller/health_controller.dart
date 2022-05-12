import 'package:shelf/shelf.dart';

class HealthController {
  getHealth(Request request) {
    print(request.context);
    return Response.ok('Get request');
  }
}
