
import 'package:flutter/material.dart';

import '../global/components/app_bar_components.dart';
import '../global/extensions/style_extensions.dart';
import '../global/utils/custom_colors.dart';
import '../homepage_screen/homepage_screen.dart';
import 'view_model/onboard_screen_viewmodel.dart';
import 'widgets/page_view_indicator.dart';

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
      appBar: appbarComponent(title: "Coin Track"),
      body: Column(
        children: [
          Spacer(flex: 5),
          Expanded(flex: 95, child: onboardScreenPageViewMethod()),
          Spacer(flex: 1),
          Expanded(flex: 1, child: onboardScreenIndicatorListViewMethod()),
          Spacer(flex: 10),
          Expanded(flex: 10, child: onBoardScreenStartButton(context)),
          Spacer(flex: 10),
        ],
      ),
    );
  }

  /// Onboard ekranı resim ve yazıları page view olarak döndüren foksiyon.
  PageView onboardScreenPageViewMethod() {
    return PageView.builder(
      itemBuilder: (context, index) {
        return widget.onboardScreenViewModel.onbardScreenArray[index];
      },
      itemCount: widget.onboardScreenViewModel.onbardScreenArray.length,
      scrollDirection: Axis.horizontal,
      controller: PageController(initialPage: 0, keepPage: true),
      onPageChanged: (int index) {
        widget.onboardScreenViewModel.selectedIndex = index;
      },
    );
  }

  /// Onboard ekranı start button fonksiyonu
  ElevatedButton onBoardScreenStartButton(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.arrow_right_alt),
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePageScreen(),
        ));
      },
      style: context.buttonStyle(
        backgroundColor: CustomColor.shared.backgroundBlueColor,
        shadowColor: CustomColor.shared.backgroundBlueColor,
        elevation: 20,
      ),
    );
  }

  /// Onboard ekranı indicatorı liste olarak döndüren fonksiyon.
  ListView onboardScreenIndicatorListViewMethod() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: PageViewIndicatorWidget(
            index: index,
            onboardScreenViewModel: widget.onboardScreenViewModel,
          ),
        );
      },
      itemCount: widget.onboardScreenViewModel.onbardScreenArray.length,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
