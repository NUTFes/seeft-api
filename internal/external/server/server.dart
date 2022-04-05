import 'dart:async' show Future;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'router.dart';

class Server {
  var server;
  var service;

  Server(this.service);

  run() async {
    final handler = _handler();
    final server = await shelf_io.serve(handler, 'localhost', 3000);
    this.server = server;
    print('Server runnning on localhost:${server.port}');
  }

  _handler() {
    final pipeline = Pipeline().addMiddleware(logRequests()).addHandler(service.handler);

    return pipeline;
  }
}
