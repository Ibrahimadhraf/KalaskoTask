import 'package:flutter/widgets.dart';

class SizeConfig {
  SizeConfig._internal();
  static final SizeConfig _instance = SizeConfig._internal();
  factory SizeConfig()=>_instance;

  MediaQueryData? _mediaQueryData;
  double? screenWidth;
   double? screenHeight;
   double? blockSizeHorizontal;
  double? blockSizeVertical;
   double? _safeAreaHorizontal;
   double? _safeAreaVertical;
  double? safeBlockHorizontal;
  double? safeBlockVertical;
  double? fontSize12;
   double? fontSize13;
   double? fontSize14;
   double? fontSize15;
   double? fontSize16;
   double? fontSize17;
   double? fontSize18;
   double? fontSize20;
   double? fontSize22;

   init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    fontSize12 = safeBlockHorizontal! * 2.75;
    fontSize13 = safeBlockHorizontal! * 3;
    fontSize14 = safeBlockHorizontal! * 3.75;
    fontSize15 = safeBlockHorizontal! * 4.5;
    fontSize16 = safeBlockHorizontal! * 5;
    fontSize17 = safeBlockHorizontal! * 6.5;
    fontSize18 = safeBlockHorizontal! * 8;
    fontSize20 = safeBlockHorizontal! * 10;
    fontSize22 = safeBlockHorizontal! * 12;
  }
}