import 'package:flutter_clock_sample/enums.dart';
import 'package:flutter_clock_sample/models/alarm_info.dart';
import 'package:flutter_clock_sample/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(const Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(const Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1),
];
