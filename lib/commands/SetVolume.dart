import 'dart:io';
import 'dart:math';

import 'package:obs_command/commands/BaseCommand.dart';

class SetVolume extends BaseCommand {
  @override
  String get description => 'Set Profile of Obs';

  @override
  String get name => 'SetVolume';

  SetVolume() {
    argParser.addOption('source', abbr: 's', mandatory: true);
    argParser.addOption('volume', abbr: 'v', mandatory: true);
  }

  @override
  Future<void> run() async {
    await super.run();

    var args = <String, dynamic>{
      'source': argResults!['source'],
      // convert percent to amplitude - Thanks to - https://github.com/REALDRAGNET/OBSCommand/blob/master/OBSCommand/Main.vb#L548
      'volume': pow(int.parse(argResults!['volume']), 3) / 1000000,
      'useDecibel': true
    };

    try {
      await obs.socket.command('SetVolume', args);
      print('Volume Set');
      exit(0);
    } catch (e) {
      print('Failed to set volume - ${e.toString()}');
      exit(2);
    }
  }
}
