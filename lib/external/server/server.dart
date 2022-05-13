import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'service.dart';

class Server {
  final Service service;

  Server(this.service);

  run() async {
    final handler = _handler();
    final server = await shelf_io.serve(handler, '0.0.0.0', 3000);
    print('Server runnning on localhost:${server.port}');
  }

  _handler() {
    final pipeline = Pipeline().addMiddleware(logRequests()).addHandler(service.handler);
    return pipeline;
  }
}
