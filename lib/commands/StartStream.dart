import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class StartStream extends BaseCommand {
  @override
  String get description => 'Tell Obs to start streaming';

  @override
  String get name => 'StartStream';

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.startStreaming();
      print('Streaming started');
      exit(0);
    } catch (e) {
      print('Failed to switch profile - ${e.toString()}');
      exit(2);
    }
  }
}
