import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class StartRecording extends BaseCommand {
  @override
  String get description => 'Tell Obs to start recording';

  @override
  String get name => 'StartRecording';

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.startRecording();
      print('Recording started');
      exit(0);
    } catch (e) {
      print('Failed to start recording - ${e.toString()}');
      exit(2);
    }
  }
}
