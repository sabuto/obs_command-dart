import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class UnMute extends BaseCommand {
  @override
  String get description => 'UnMute the specified audio source';

  @override
  String get name => 'UnMute';

  UnMute() {
    argParser.addOption('source',
        abbr: 's',
        mandatory: true,
        valueHelp: 'Audio Source',
        help: 'The name of the audio source to unmute');
  }

  @override
  Future<void> run() async {
    await super.run();
    var args = <String, dynamic>{
      'source': argResults!['source'],
      'mute': false
    };
    try {
      await obs.socket.command('SetMute', args);
      print('Source UnMuted');
      exit(0);
    } catch (e) {
      print('Failed to UnMute source - ${e.toString()}');
      exit(2);
    }
  }
}
