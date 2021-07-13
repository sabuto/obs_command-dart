import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class Mute extends BaseCommand {
  @override
  String get description => 'Mute the specified audio source';

  @override
  String get name => 'Mute';

  Mute() {
    argParser.addOption('source', abbr: 's', mandatory: true,
        valueHelp: 'Audio Source',
        help: 'The name of the audio source to mute');
  }

  @override
  Future<void> run() async {
    await super.run();
    var args = <String, dynamic>{'source': argResults!['source'], 'mute': true};
    try {
      await obs.socket.command('SetMute', args);
      print('Source Muted');
      exit(0);
    } catch (e) {
      print('Failed to Mute source - ${e.toString()}');
      exit(2);
    }
  }
}
