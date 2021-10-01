import 'package:flutter/material.dart';
import 'package:cov_stats/app_color.dart';
import 'package:cov_stats/app_fonts.dart';

class AppStyles {
  static const TextStyle b28 = TextStyle(
      fontSize: 28,
      fontFamily: AppFonts.bold,
      color: AppColor.colorTextPrimary);

  static const TextStyle r16 = TextStyle(
      fontSize: 16,
      fontFamily: AppFonts.regular,
      color: AppColor.colorTextSecondary);

  static const TextStyle m12 = TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.medium,
      color: AppColor.colorTextPrimary);

  static const TextStyle t28 = TextStyle(
    fontSize: 28,
    fontFamily: AppFonts.regular,
    color: AppColor.colorTextRed,
  );
  static const TextStyle t14 = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.regular,
  );

  static const TextStyle bottom_bar =
      TextStyle(fontSize: 11, fontFamily: AppFonts.regular);
}
