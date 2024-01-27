import '../schedule_page/widgets/schedule_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key})
      : super(
          key: key,
        );

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildSchedule(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSchedule(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 16.v,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return ScheduleItemWidget();
        },
      ),
    );
  }
}
