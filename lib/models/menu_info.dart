import 'package:flutter_clock_sample/enums.dart';
import 'package:flutter_clock_sample/utils/base_model.dart';

class MenuInfo extends BaseModel {
  MenuType? menuType;
  String? title;
  String? imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

//Important
    notifyListeners();
  }
}
