// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String svgIcon = "assets/svgs";

class AppSvgs {
  //static const String home = "$svgIcon/nav/home.svg";

  static const String logo = "logo";
  static const String cartIcon = "cartIcon";
  static const String checkCircle = "check-circle";
  static const String closeIcon = "closeIcon";
  static const String deleteIcon = "deleteIcon";
  static const String favIcon = "favIcon";
  static const String homeIcon = "homeIcon";
  static const String notificationIcon = "notificationIcon";
  static const String profileIcon = "profileIcon";
  static const String searchIcon = "searchIcon";
  static const String minus = "minus";
  static const String plus = "plus";
}


class SvgWidget extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final Color? color;

  const SvgWidget(this.name, {super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      height: height,
      width: width,
      color: color,
    );
  }
}