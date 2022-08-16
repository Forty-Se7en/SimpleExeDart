import 'dart:async';
import 'dart:io';

import 'package:console_timer/console_timer.dart' as console_timer;

final File _logFile = new File('events.txt');
IOSink? _sink;

void main(List<String> arguments) async {
  try {
    _sink = _logFile.openWrite(mode: FileMode.append);
    _sink!.writeln('Started at ${new DateTime.now()}\n');
    int periodicTime = 5;

    Timer.periodic(Duration(seconds: periodicTime), (_) async {
      onTimer();
    });
  } on Exception catch (e) {
    DateTime _now = DateTime.now();
    _sink!.writeln(
        'EXCEPTION OCCURED AT: ${_now.hour}:${_now.minute}:${_now.second}');
    _sink!.writeln(e);
  }
}

void onTimer() async {
  DateTime _now = DateTime.now();
  _sink!.writeln('timestamp: ${_now.hour}:${_now.minute}:${_now.second}');
}
