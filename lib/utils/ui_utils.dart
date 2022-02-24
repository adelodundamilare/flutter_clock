import 'package:flutter/cupertino.dart';

class UiUtils {
  static List<Widget> projectDynamicWidget(
      {required List<dynamic> items,
      required Widget Function(int position) builder}) {
    return items
        .asMap()
        .map((int position, _) => MapEntry(position, builder(position)))
        .values
        .toList();
  }
}
