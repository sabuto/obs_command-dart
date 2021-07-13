import 'package:args/command_runner.dart';
import 'package:obs_command/commands/CustomCommand.dart';
import 'package:obs_command/commands/HideSource.dart';
import 'package:obs_command/commands/MuteCommand.dart';
import 'package:obs_command/commands/SetProfile.dart';
import 'package:obs_command/commands/SetVolume.dart';
import 'package:obs_command/commands/ShowSource.dart';
import 'package:obs_command/commands/StartRecording.dart';
import 'package:obs_command/commands/StartStream.dart';
import 'package:obs_command/commands/StopRecording.dart';
import 'package:obs_command/commands/StopStream.dart';
import 'package:obs_command/commands/SwitchSceneCommand.dart';
import 'package:obs_command/commands/ToggleAudioCommand.dart';
import 'package:obs_command/commands/ToggleSource.dart';
import 'package:obs_command/commands/UnMute.dart';

void main(List<String> arguments) async {
  var parser = buildCommands();
  await parser.run(arguments);
}

CommandRunner buildCommands() {
  var runner =
      CommandRunner('obs_command', 'A command runner for obs written in dart')
        ..addCommand(SwitchScene())
        ..addCommand(ToggleAudio())
        ..addCommand(Mute())
        ..addCommand(UnMute())
        ..addCommand(SetProfile())
        ..addCommand(SetVolume())
        ..addCommand(StartStream())
        ..addCommand(StopStream())
        ..addCommand(CustomCommand())
        ..addCommand(ShowSource())
        ..addCommand(HideSource())
        ..addCommand(ToggleSource())
        ..addCommand(StartRecording())
        ..addCommand(StopRecording());
  return runner;
}
