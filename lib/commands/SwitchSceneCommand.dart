import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class SwitchScene extends BaseCommand {
  @override
  String get description => 'Change the current scene in obs';

  @override
  String get name => 'SetScene';

  SwitchScene() {
    argParser.addOption('scene', abbr: 's', mandatory: true);
  }

  @override
  Future<void> run() async {
    await super.run();
    var scene = <String, dynamic>{'scene-name': argResults!['scene']};
    try {
      await obs.socket.setCurrentScene(scene);
      print('Scene Changed');
      exit(0);
    } catch (e) {
      print('Failed to set scene - ${e.toString()}');
      exit(2);
    }
  }
}
