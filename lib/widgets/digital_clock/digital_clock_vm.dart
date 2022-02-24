import 'dart:async';

import 'package:flutter_clock_sample/utils/base_model.dart';
import 'package:intl/intl.dart';

class DigitalClockVM extends BaseModel {
  initState() {}

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("H:m:s").format(now);
  }

  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;
  set dateTime(DateTime value) {
    _dateTime = value;
    notifyListeners();
  }

  Timer? _timer;
  Timer? get timer => _timer;
  set timer(Timer? value) {
    _timer = value;
    notifyListeners();
  }

  String _minute = "";
  String get minute => _minute;
  set minute(String value) {
    _minute = value;
    notifyListeners();
  }

  String _hour = "";
  String get hour => _hour;
  set hour(String value) {
    _hour = value;
    notifyListeners();
  }

  void _updateModel() {}

  void _updateTime() {
    dateTime = DateTime.now();
    timer = Timer(
      const Duration(minutes: 1) -
          Duration(seconds: _dateTime.second) -
          Duration(milliseconds: _dateTime.millisecond),
      _updateTime,
    );
  }
}
