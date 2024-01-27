import '../message_history_page/widgets/messagehistory_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MessageHistoryPage extends StatefulWidget {
  const MessageHistoryPage({Key? key})
      : super(
          key: key,
        );

  @override
  MessageHistoryPageState createState() => MessageHistoryPageState();
}

class MessageHistoryPageState extends State<MessageHistoryPage>
    with AutomaticKeepAliveClientMixin<MessageHistoryPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildMessageHistory(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMessageHistory(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return MessagehistoryItemWidget();
          },
        ),
      ),
    );
  }
}
