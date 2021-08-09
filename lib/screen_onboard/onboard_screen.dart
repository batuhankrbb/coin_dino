import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/main.dart';
import 'package:coin_dino/screen_home/home_screen.dart';
import 'package:coin_dino/screen_onboard/components/onboard_navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../global/components/app_bar_components.dart';
import '../global/extensions/style_extensions.dart';
import '../global/utils/custom_colors.dart';
import 'components/onboard_image_title_widget.dart';
import 'components/page_view_indicator.dart';
import 'view_model/onboard_screen_viewmodel.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  var pageController = PageController(initialPage: 0, keepPage: true);

  var onBoardScreenViewModel = getit.get<OnboardScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(flex: 5),
          Expanded(
            flex: 95,
            child: onboardScreenPageViewMethod(),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: onboardScreenIndicatorListViewMethod(),
          ),
          Spacer(flex: 10),
          Expanded(
            flex: 8,
            child: OnboardNavigateButton(),
          ),
          Spacer(flex: 10),
        ],
      ),
    );
  }

  /// Onboard ekranı resim ve yazıları page view olarak döndüren foksiyon.
  PageView onboardScreenPageViewMethod() {
    return PageView.builder(
      itemBuilder: (context, index) {
        return onbardScreenArray[index];
      },
      itemCount: onbardScreenArray.length,
      scrollDirection: Axis.horizontal,
      controller: pageController,
      onPageChanged: (int index) {
        onBoardScreenViewModel.selectedIndex = index;
      },
    );
  }

  /// Onboard ekranı indicatorı liste olarak döndüren fonksiyon.
  ListView onboardScreenIndicatorListViewMethod() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return buildIndicatorCell(index);
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: context.getWidth(0.02),
        );
      },
      itemCount: onbardScreenArray.length,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  PageViewIndicatorWidget buildIndicatorCell(int index) {
    return PageViewIndicatorWidget(
      index: index,
    );
  }

  final List<Widget> onbardScreenArray = [
    OnboardScreenImageAndTitleWidget(
      description: "dsadsadasdasd",
      image: "onboard_notify_image",
      title: "Bilidirm",
    ),
    OnboardScreenImageAndTitleWidget(
      description: "dsadasdadasd",
      image: "onboard_search_image",
      title: "Kategori",
    ),
    OnboardScreenImageAndTitleWidget(
      description: "dsadsadasdasda",
      image: "onboard_detail_image",
      title: "Detay Sayfası",
    ),
    OnboardScreenImageAndTitleWidget(
      description: "dasdsadasdas",
      image: "onboard_customize_image",
      title: "Renkli Tema",
    ),
  ];
}
