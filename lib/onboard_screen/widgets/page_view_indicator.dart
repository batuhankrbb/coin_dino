import 'package:coin_dino/onboard_screen/view_model/onboard_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PageViewIndicatorWidget extends StatelessWidget {
  final int index;
  final OnboardScreenViewModel onboardScreenViewModel;
  const PageViewIndicatorWidget(
      {Key? key, required this.index, required this.onboardScreenViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedContainer(
          width: (onboardScreenViewModel.selectedIndex == index) ? 30 : 15,
          height: 15,
          duration: Duration(milliseconds: 100),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        );
      },
    );
  }
}
