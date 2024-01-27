import '../articles_screen/widgets/articlelist1_item_widget.dart';
import '../articles_screen/widgets/articlelist_item_widget.dart';
import '../articles_screen/widgets/chipview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healthon/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class ArticlesScreen extends StatelessWidget {
  ArticlesScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 23.v),
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: CustomSearchView(
                              controller: searchController,
                              hintText: "Search articles, news")),
                      SizedBox(height: 28.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 24.h),
                              child: Text("Popular Articles",
                                  style: theme.textTheme.titleMedium))),
                      SizedBox(height: 10.v),
                      _buildChipView(context),
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: _buildRelatedArticlesRow(context,
                              relatedArticlesText: "Trending Articles",
                              seeAllText: "See all")),
                      SizedBox(height: 10.v),
                      _buildArticleList(context),
                      SizedBox(height: 26.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: _buildRelatedArticlesRow(context,
                              relatedArticlesText: "Related Articles",
                              seeAllText: "See all")),
                      SizedBox(height: 12.v),
                      _buildArticleList1(context)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 8.v)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Articles"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIconChevronLeftOnprimary24x24,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.v))
        ]);
  }

  /// Section Widget
  Widget _buildChipView(BuildContext context) {
    return Wrap(
        runSpacing: 5.v,
        spacing: 5.h,
        children: List<Widget>.generate(3, (index) => ChipviewItemWidget()));
  }

  /// Section Widget
  Widget _buildArticleList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 219.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 24.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15.h);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ArticlelistItemWidget();
                })));
  }

  /// Section Widget
  Widget _buildArticleList1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return Articlelist1ItemWidget();
            }));
  }

  /// Common widget
  Widget _buildRelatedArticlesRow(
    BuildContext context, {
    required String relatedArticlesText,
    required String seeAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(relatedArticlesText,
          style: CustomTextStyles.titleMediumBlack900
              .copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(seeAllText,
              style: CustomTextStyles.labelLargePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }
}
