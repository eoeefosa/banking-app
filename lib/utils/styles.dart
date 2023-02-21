import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/size_config.dart';

class Styles {
  static Color primaryColor = const Color(0xFF161D28);
  static Color accentColor = const Color(0xFF030C10);
  static Color primaryWithOpacityColor = const Color(0xFF212E3E);
  static Color yellowColor = const Color(0xFFDFE94B);
  static Color greenColor = const Color(0xFF024751);

  static Color cyanblue = const Color.fromRGBO(72, 146, 201, 1);
  static Color cyanpink = const Color.fromRGBO(218, 77, 214, 1);
  static Color cyanbluesl = const Color.fromRGBO(0, 39, 88, 1);
  static Color bluecardColor2 = const Color.fromRGBO(146, 72, 243, 1);
  static Color blueCardcolor = const Color.fromRGBO(21, 92, 206, 1);
  static Color purchasedataheadercolor = const Color.fromRGBO(53, 38, 133, 1);

  static Color greyColor = const Color(0xFFE6E8E8);
  static Color whiteColor = Colors.white;
  static Color buttonColor = const Color(0xFF4C66EE);
  static Color blueColor = const Color(0xFF4BACF7);
  static TextStyle textStyle =
      TextStyle(fontSize: getProportionateScreenWidth(15));
  static TextStyle titleStyle = TextStyle(
      fontFamily: 'DMSans',
      fontSize: getProportionateScreenWidth(19),
      fontWeight: FontWeight.w500);
}
