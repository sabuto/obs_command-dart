import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class ToggleAudio extends BaseCommand {
  @override
  String get description => 'Toggle the mute value of the audio source';

  @override
  String get name => 'ToggleAudio';

  ToggleAudio() {
    argParser.addOption('source',
        abbr: 's',
        mandatory: true,
        help: 'Allows you to toggle and audio source',
        valueHelp: 'Audio Source');
  }

  @override
  Future<void> run() async {
    await super.run();
    var source = <String, dynamic>{'source': argResults!['source']};
    try {
      await obs.socket.command('ToggleMute', source);
      print('Source Audio Toggled');
      exit(0);
    } catch (e) {
      print('Failed to toggle audio - ${e.toString()}');
      exit(2);
    }
  }
}
