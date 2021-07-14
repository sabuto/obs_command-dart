import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class ResumeRecording extends BaseCommand {
  @override
  String get description => 'Tell Obs to resume recording';

  @override
  String get name => 'ResumeRecording';

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.resumeRecording();
      print('Recording resumed');
      exit(0);
    } catch (e) {
      print('Failed to resume recording - ${e.toString()}');
      exit(2);
    }
  }
}
