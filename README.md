# Obs_command

### What it does

Obs_command is a cross-platform commandline utility for obs-websockets written in dart. I wrote this because I was
wanting to learn dart and was unsure what to write. I took inspiration
from [OBSCommander](https://github.com/REALDRAGNET/OBSCommand)

### Platforms

- [x] Widows
- [x] MacOs - Untested
- [x] Linux

### How To Use

Download the executable for your platform and the config.yaml from https://github.com/Sabuto/obs_command-dart/releases.

Make sure the config.yaml and obs_command are in the same directory.

From the Terminal or command line navigate to the folder with the executable in and run
```obs_command help```
This will display the following list

```A command runner for obs written in dart by Sacrementus

Usage: obs_command <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  Command           Send a custom Command to obs
  HideSource        Hide a source in obs
  Mute              Mute the specified audio source
  PauseRecording    Tell Obs to pause recording
  Profile           Set Profile of Obs
  ResumeRecording   Tell Obs to resume recording
  SetScene          Change the current scene in obs
  SetVolume         Set Profile of Obs
  ShowSource        Show a source in obs
  StartRecording    Tell Obs to start recording
  StartStream       Tell Obs to start streaming
  StopRecording     Tell Obs to stop recording
  StopStream        Tell Obs to stop streaming
  ToggleAudio       Toggle the mute value of the audio source
  ToggleSource      Toggle a source in obs
  UnMute            UnMute the specified audio source

Run "obs_command help <command>" for more information about a command.
```

### Future

Write tests

I will be upgrading this to work with the v5 of obswesockets when it is released.

I will be adding more commands periodically. If you would like to suggest a command you can open an Issue, I am also
happy to accept pr requests.