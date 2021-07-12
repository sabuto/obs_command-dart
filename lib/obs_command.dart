import 'dart:io';

import 'package:obs_websocket/obs_websocket.dart';
import 'package:yaml/yaml.dart';

class ObsCommand {
  String? host = 'localhost';
  String? port = '4444';
  String? password;
  late final ObsWebSocket socket;

  ObsCommand(bool config, [String? host, String? port, String? password]) {
    // pull values from config if it exists - allow them to be overwritten by arguments at runtime
    if (config) {
      var file = loadYaml(File('config.yaml').readAsStringSync());
      this.host = file['host'];
      this.port = file['port'];
      this.password = file['password'];
    } else {
      print('Config not found');
    }
    // check to see if args were passed in, if they were set the values
    if (host != null) this.host = host;
    if (port != null) this.port = port;
    if (password != null) this.password = password;
  }

  Future<void> connectToObs() async {
    socket = await ObsWebSocket.connect(
        connectUrl: 'ws://$host:$port',
        fallbackEvent: (BaseEvent event) {
          print('event: ${event.rawEvent}');
        });

    final authRequired = await socket.getAuthRequired();

    if (authRequired.authRequired != false) {
      await socket.authenticate(authRequired, password ?? '');
    }
  }
}
