import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class SetProfile extends BaseCommand {
  @override
  String get description => 'Set Profile of Obs';

  @override
  String get name => 'Profile';

  SetProfile() {
    argParser.addOption('name',
        abbr: 'n',
        mandatory: true,
        valueHelp: 'Profile Name',
        help: 'The name of the profile to change to');
  }

  @override
  Future<void> run() async {
    await super.run();
    var args = <String, dynamic>{'profile-name': argResults!['name']};
    try {
      await obs.socket.command('SetCurrentProfile', args);
      print('Profile switched');
      exit(0);
    } catch (e) {
      print('Failed to switch profile - ${e.toString()}');
      exit(2);
    }
  }
}
