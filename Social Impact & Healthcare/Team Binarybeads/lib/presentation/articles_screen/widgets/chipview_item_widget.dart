import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewItemWidget extends StatelessWidget {
  const ChipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 16.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Covid-19",
        style: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.primary,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
