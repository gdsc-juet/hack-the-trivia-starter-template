import '../pharmacy_screen/widgets/popularproductlist_item_widget.dart';
import '../pharmacy_screen/widgets/productonsalelist_item_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';
import 'package:healthon/widgets/app_bar/appbar_leading_image.dart';
import 'package:healthon/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:healthon/widgets/app_bar/appbar_trailing_image.dart';
import 'package:healthon/widgets/app_bar/custom_app_bar.dart';
import 'package:healthon/widgets/custom_search_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore_for_file: must_be_immutable
class PharmacyScreen extends StatelessWidget {
  PharmacyScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  Completer<WebViewController> webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 21.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: CustomSearchView(
                          controller: searchController,
                          hintText: "Search drugs, category")),
                  SizedBox(height: 24.v),
                  _buildCta(context),
                  SizedBox(height: 27.v),
                  Padding(
                      padding: EdgeInsets.only(left: 21.h, right: 24.h),
                      child: _buildHeaderRow(context,
                          productOnSaleText: "Popular Product",
                          seeAllText: "See all")),
                  SizedBox(height: 10.v),
                  _buildPopularProductList(context),
                  SizedBox(height: 26.v),
                  Padding(
                      padding: EdgeInsets.only(left: 21.h, right: 24.h),
                      child: _buildHeaderRow(context,
                          productOnSaleText: "Product on Sale",
                          seeAllText: "See all")),
                  SizedBox(height: 12.v),
                  _buildProductOnSaleList(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 42.v,
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 10.v)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Pharmacy"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 9.v))
        ]);
  }

  /// Section Widget
  Widget _buildCta(BuildContext context) {
    return SizedBox(
        height: 135.v,
        width: 335.h,
        child: WebView(
            initialUrl: 'https://flutter.dev',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              webViewController.complete(controller);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            onPageStarted: (String url) {
              print("Page started loading: $url");
            },
            onPageFinished: (String url) {
              print("Page finished loading: $url");
            }));
  }

  /// Section Widget
  Widget _buildPopularProductList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 165.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 21.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 21.h);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return PopularproductlistItemWidget();
                })));
  }

  /// Section Widget
  Widget _buildProductOnSaleList(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 165.v,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 21.h),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 17.h);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ProductonsalelistItemWidget();
                })));
  }

  /// Common widget
  Widget _buildHeaderRow(
    BuildContext context, {
    required String productOnSaleText,
    required String seeAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(productOnSaleText,
          style: theme.textTheme.titleMedium!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child: Text(seeAllText,
              style: CustomTextStyles.labelLargePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }
}
