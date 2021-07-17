import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class StudioMode extends BaseCommand {
  @override
  String get description => 'Enable or disable studio mode';

  @override
  String get name => 'StudioMode';

  StudioMode() {
    argParser.addOption('action',
        abbr: 'a',
        mandatory: true,
        help: 'enable or disable studio mode',
        valueHelp: 'enable/disable');
  }

  @override
  Future<void> run() async {
    await super.run();
    var action = argResults!['action'];
    try {
      if (action == 'enable') {
        await obs.socket.enableStudioMode();
        print('Studio Mode enabled');
      } else if (action == 'disable') {
        await obs.socket.disableStudioMode();
        print('Studio Mode disabled');
      } else {
        printUsage();
      }
      exit(0);
    } catch (e) {
      print('Failed to toggle audio - ${e.toString()}');
      exit(2);
    }
  }
}
