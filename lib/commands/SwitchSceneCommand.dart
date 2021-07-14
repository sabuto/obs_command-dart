import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class SwitchScene extends BaseCommand {
  @override
  String get description => 'Change the current scene in obs';

  @override
  String get name => 'SetScene';

  SwitchScene() {
    argParser.addOption('scene',
        abbr: 's',
        mandatory: true,
        help: 'The name of the scene to change to',
        valueHelp: 'Scene Name');
  }

  @override
  Future<void> run() async {
    await super.run();
    try {
      await obs.socket.setCurrentScene(argResults!['scene']);
      print('Scene Changed');
      exit(0);
    } catch (e) {
      print('Failed to change scene - ${e.toString()}');
      exit(2);
    }
  }
}
