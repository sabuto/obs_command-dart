import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class StopStream extends BaseCommand {
  @override
  String get description => 'Tell Obs to stop streaming';

  @override
  String get name => 'StopStream';

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.stopStreaming();
      print('Streaming Stopped');
      exit(0);
    } catch (e) {
      print('Failed to stop streaming - ${e.toString()}');
      exit(2);
    }
  }
}
