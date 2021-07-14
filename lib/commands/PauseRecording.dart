import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class PauseRecording extends BaseCommand {
  @override
  String get description => 'Tell Obs to pause recording';

  @override
  String get name => 'PauseRecording';

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.pauseRecording();
      print('Recording paused');
      exit(0);
    } catch (e) {
      print('Failed to Pause Recording - ${e.toString()}');
      exit(2);
    }
  }
}
