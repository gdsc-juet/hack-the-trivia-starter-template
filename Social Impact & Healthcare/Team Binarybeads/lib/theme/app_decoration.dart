import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

class AppDecoration {
  // Background decorations
  static BoxDecoration get background => BoxDecoration(
        color: appTheme.gray100,
      );

  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.5),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0),
            appTheme.black900.withOpacity(0.7),
          ],
        ),
      );

  // Linear decorations
  static BoxDecoration get linear => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.secondaryContainer,
            theme.colorScheme.onError,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.1),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              17,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray60014,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray3001 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: appTheme.whiteA700,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder29 => BorderRadius.circular(
        29.h,
      );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );
  static BorderRadius get circleBorder44 => BorderRadius.circular(
        44.h,
      );
  static BorderRadius get circleBorder51 => BorderRadius.circular(
        51.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL5 => BorderRadius.only(
        topRight: Radius.circular(5.h),
        bottomLeft: Radius.circular(5.h),
        bottomRight: Radius.circular(5.h),
      );
  static BorderRadius get customBorderBL8 => BorderRadius.only(
        topRight: Radius.circular(8.h),
        bottomLeft: Radius.circular(8.h),
        bottomRight: Radius.circular(8.h),
      );
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.h),
      );
  static BorderRadius get customBorderTL64 => BorderRadius.only(
        topLeft: Radius.circular(64.h),
      );
  static BorderRadius get customBorderTL8 => BorderRadius.only(
        topLeft: Radius.circular(8.h),
        bottomLeft: Radius.circular(8.h),
        bottomRight: Radius.circular(8.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder11 => BorderRadius.circular(
        11.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
  static BorderRadius get roundedBorder35 => BorderRadius.circular(
        35.h,
      );
  static BorderRadius get roundedBorder57 => BorderRadius.circular(
        57.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
  static BorderRadius get roundedBorder81 => BorderRadius.circular(
        81.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
