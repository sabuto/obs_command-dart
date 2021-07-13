import 'dart:io';

import 'package:obs_command/commands/BaseCommand.dart';

class CustomCommand extends BaseCommand {
  @override
  String get description => 'Send a custom Command to obs';

  @override
  String get name => 'Command';

  CustomCommand() {
    argParser.addOption('command',
        abbr: 'c',
        mandatory: true,
        valueHelp: 'Command Name',
        help: 'The name of the command to send to obs');
    argParser.addOption('args',
        abbr: 'a',
        valueHelp: 'request field name:request field value',
        help:
            'Arguments to send with command e.g source-name:source,anothervalue:here');
  }

  @override
  Future<void> run() async {
    await super.run();
    var cmds = <String, String>{};
    var command = argResults!['command'];
    String? args = argResults?['args'];

    if (args != null) {
      var split = args.split(',');

      split.forEach((element) {
        var help = element.split(':');
        cmds.putIfAbsent(help[0], () => help[1]);
      });
    }
    try {
      await obs.socket.command(command, cmds);
      print('Command Sent');
      exit(0);
    } catch (e) {
      print('Failed to switch profile - ${e.toString()}');
      exit(2);
    }
  }
}
