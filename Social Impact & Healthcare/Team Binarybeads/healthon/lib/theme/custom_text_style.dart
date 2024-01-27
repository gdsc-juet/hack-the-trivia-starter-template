import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumSFProDisplayErrorContainer =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallBluegray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodySmallBluegray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmallOnPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  // Headline text style
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 25.fSize,
      );
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLargeAmber500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.amber500,
      );
  static get labelLargeAmber500SemiBold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.amber500,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBluegray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray400,
      );
  static get labelLargeBluegray700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray700,
      );
  static get labelLargeErrorContainer => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 13.fSize,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary_1 => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumBlue50 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blue50,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelSmallInterPrimary =>
      theme.textTheme.labelSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 9.fSize,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallInterWhiteA700 =>
      theme.textTheme.labelSmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 9.fSize,
      );
  // Title text style
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumErrorContainer => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray500_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterPrimaryContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w900,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumRedA200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.redA200,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA70018 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
      );
  static get titleMediumff0b0c0c => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF0B0C0C),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumff90979e => theme.textTheme.titleMedium!.copyWith(
        color: Color(0XFF90979E),
        fontWeight: FontWeight.w500,
      );
  static get titleSmallAmber500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.amber500,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBluegray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray400,
      );
  static get titleSmallBluegray700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimarySemiBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallWhiteA700SemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
