import 'dart:ui';

import 'package:coin_dino/core/image/image_helper.dart';
import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:coin_dino/onboard_screen/view_model/onboard_screen_viewmodel.dart';
import 'package:flutter/material.dart';

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
                itemCount:
                    widget.onboardScreenViewModel.onbardScreenArray.length,
                scrollDirection: Axis.horizontal,
              )),
          Spacer(flex: 5),
          Expanded(flex: 5, child: Container(color: Colors.red)),
          Spacer(flex: 2),
          Expanded(flex: 10, child: Container(color: Colors.red)),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}

class OnboardScreenImageAndTitleWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  OnboardScreenImageAndTitleWidget({
    Key? key,
    required this.description,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 70,
            child: ImageHelper.shared.getAssetImage(imageName: image)),
        Spacer(flex: 10),
        Expanded(
            flex: 8,
            child: Container(
              child: Text(title,
                  style: TextStyle(
                      fontFamily: "RockoFLF",
                      color: Colors.black,
                      fontSize: 25),
                  maxLines: 1),
            )),
        Spacer(flex: 3),
        Expanded(
          flex: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
