import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class ToggleSource extends BaseCommand {
  @override
  String get description => 'Toggle a source in obs';

  @override
  String get name => 'ToggleSource';

  ToggleSource() {
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
    bool visible;
    var response;
    var args = <String, dynamic>{
      'item': argResults!['source'],
    };
    if (argResults?['scene'] != null) {
      args['scene-name'] = argResults?['scene'];
    }
    try {
      response = await obs.socket.command('GetSceneItemProperties', args);
    } catch (e) {
      print('Scene Error: $e');
      exit(2);
    }
    if (response.rawResponse['visible'] == true) {
      visible = false;
    } else {
      visible = true;
    }

    args['visible'] = visible;

    try {
      await obs.socket.command('SetSceneItemProperties', args);
      print('Source visibility changed');
      exit(0);
    } catch (e) {
      print('Failed to toggle source - ${e.toString()}');
      exit(2);
    }
  }
}
