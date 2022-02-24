import 'package:flutter/material.dart';
import 'package:flutter_clock_sample/constants/theme_data.dart';
import 'package:flutter_clock_sample/data.dart';
import 'package:flutter_clock_sample/enums.dart';
import 'package:flutter_clock_sample/models/menu_info.dart';
import 'package:flutter_clock_sample/screens/alarm_page.dart';
import 'package:flutter_clock_sample/screens/clock_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: CustomColors.dividerColor,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else {
                  return RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 20),
                      children: <TextSpan>[
                        const TextSpan(text: 'Upcoming Tutorial\n'),
                        TextSpan(
                          text: value.title,
                          style: const TextStyle(fontSize: 48),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              : Colors.transparent,
          child: TextButton(
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource ?? '',
                  scale: 1.5,
                ),
                const SizedBox(height: 16),
                Text(
                  currentMenuInfo.title ?? '',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      color: CustomColors.primaryTextColor,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
