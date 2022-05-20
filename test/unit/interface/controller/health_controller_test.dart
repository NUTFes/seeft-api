import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'package:seeft_api/interface/controller/health_controller.dart';

void main() {
  final controller = HealthController();

  test('health_controller', () {
    var request = Request('GET', Uri.parse('http://localhost:3000/healthz'));
    expect(controller.getHealth(request).readAsString(), completion(equals('Get request')));
  });
}
