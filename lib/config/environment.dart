import 'dart:io' show Platform;

class Environment {
  String _applicationEnv = '';
  String _serverAddress = '';
  String _serverPort = '';
  String _databaseHost = '';
  String _databaseUser = '';
  String _databasePassword='';
  String _databaseName = '';

  Environment() {
    Map<String, String> env = Platform.environment;
    _applicationEnv = env['APPLICATION_ENV'] ?? 'develop';
    _serverAddress = env['SERVER_ADDRESS'] ?? '0.0.0.0';
    _serverPort = env['SERVER_PORT']  ?? '3000';
    _databaseHost = env['DATABASE_HOST'] ?? '';
    _databaseUser = env['DATABASE_USER'] ?? '';
    _databasePassword = env['DATABASE_PASSWORD'] ?? '';
    _databaseName = env['DATABASE_NAME'] ?? 'seeft';
  }

  get applicationEnv => _applicationEnv;
  get serverAddress => _serverAddress;
  get serverPort => serverPort;
  get databaseHost => databaseHost;
  get databaseUser => databaseUser;
  get databasePassword => databasePassword;
  get databaseName => databaseName;
}
