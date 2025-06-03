import 'package:flutter/material.dart';

const String images = "assets/images";

class AppImages {
  AppImages._();

  static const avatar = "$images/avatar.png";
  static const googlePixel = "$images/googlePixel.png";
  static const iPhone = "$images/iPhone.png";
  static const iPod = "$images/iPod.png";
  static const laptop = "$images/laptop.png";


}

// Image Helper
SizedBox imageHelper(String image,
    {double? height, double? width, BoxFit? fit, Color? color}) {
  return SizedBox(
    height: height,
    width: width,
    child: Image.asset(
      image,
      fit: fit,
      color: color,
    ),
  );
}
