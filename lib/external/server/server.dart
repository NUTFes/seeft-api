import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'service.dart';
import '../../config/config.dart';

class Server {
  final Service service;
  final Environment env;

  Server(this.service, this.env);

  run() async {
    final handler = _handler();
    final server = await shelf_io.serve(
      handler,
      env.server.address,
      int.parse(env.server.port),
    );
    print('Server runnning on localhost:${server.port}');
  }

  _handler() {
    final pipeline = Pipeline().addMiddleware(logRequests()).addHandler(service.handler);
    return pipeline;
  }
}
