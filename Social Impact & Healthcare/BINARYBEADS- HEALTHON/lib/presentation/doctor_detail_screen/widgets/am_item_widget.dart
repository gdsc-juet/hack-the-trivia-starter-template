import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore: must_be_immutable
class AmItemWidget extends StatelessWidget {
  const AmItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "09:00 AM",
        style: TextStyle(
          color: appTheme.gray500,
          fontSize: 12.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.whiteA700,
      selectedColor: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray300,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          15.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
