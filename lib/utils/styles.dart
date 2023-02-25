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
  static Color fundTransferCardColor1 = const Color.fromRGBO(42, 181, 127, 1);
  static Color fundTransferCardColorD =
      const Color.fromRGBO(24, 104, 73, 1).withOpacity(.5);

  static Color purchaseCardColor1 = const Color.fromRGBO(7, 176, 232, 1);
  static Color purchaseCardColorD =
      const Color.fromRGBO(4, 117, 155, 1).withOpacity(0.3);

  static Color transactionCardColor1 = const Color.fromRGBO(235, 189, 86, 1);
  static Color transactionCardColorD =
      const Color.fromRGBO(158, 127, 58, 1).withOpacity(0.5);

  static Color contactCardColor1 = const Color.fromRGBO(83, 75, 185, 1);
  static Color contactCardColorD =
      const Color.fromRGBO(48, 43, 108, 1).withOpacity(.5);

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
