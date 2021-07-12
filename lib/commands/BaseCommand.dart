import 'package:args/command_runner.dart';
import 'package:obs_command/obs_command.dart';

class BaseCommand extends Command {
  late ObsCommand obs;

  @override
  String get description => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  BaseCommand() {
    obs = ObsCommand(false, 'localhost', '4444');
  }

  @override
  Future<void> run() async {
    await obs.connectToObs();
  }
}
