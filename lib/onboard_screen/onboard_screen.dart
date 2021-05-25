import 'dart:ui';

import 'package:coin_dino/core/image/image_helper.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:coin_dino/onboard_screen/view_model/onboard_screen_viewmodel.dart';
import 'package:coin_dino/onboard_screen/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);
  final OnboardScreenViewModel onboardScreenViewModel =
      OnboardScreenViewModel();
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Coin Track",
          style: TextStyle(
              color: CustomColor.shared.backgroundBlueColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Spacer(flex: 12),
          Expanded(
            flex: 80,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return widget.onboardScreenViewModel.onbardScreenArray[index];
              },
              itemCount: widget.onboardScreenViewModel.onbardScreenArray.length,
              scrollDirection: Axis.horizontal,
              controller: PageController(initialPage: 0, keepPage: true),
              onPageChanged: (int index) {
                widget.onboardScreenViewModel.selectedIndex = index;
              },
            ),
          ),
          Spacer(flex: 5),
          Expanded(
            flex: 10,
            child: PageViewIndicatorWidget(
              index: 0,
              onboardScreenViewModel: widget.onboardScreenViewModel,
            ),
          ),
          Spacer(flex: 2),
          Expanded(flex: 10, child: Container(color: Colors.red)),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
