import 'package:flutter/cupertino.dart';

class ScreenController{
  static late double screenHeight;
  static late double screenWidth;

  static void sizeInitialization(BuildContext context){
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
  }


}