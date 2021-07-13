import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class HideSource extends BaseCommand {
  @override
  String get description => 'Hide a source in obs';

  @override
  String get name => 'HideSource';

  HideSource() {
    argParser.addOption('source',
        abbr: 's',
        mandatory: true,
        help: 'The name of the source to change to',
        valueHelp: 'Source Name');
    argParser.addOption('scene',
        abbr: 'i',
        help:
            'The name of the scene the source is on, will default to current scene if left blank',
        valueHelp: 'Scene Name');
  }

  @override
  Future<void> run() async {
    await super.run();
    var args = <String, dynamic>{
      'item': argResults!['source'],
      'visible': false
    };
    if (argResults?['scene'] != null) {
      args['scene-name'] = argResults?['scene'];
    }
    try {
      await obs.socket.command('SetSceneItemProperties', args);
      print('Source Hidden');
      exit(0);
    } catch (e) {
      print('Failed to set scene - ${e.toString()}');
      exit(2);
    }
  }
}
