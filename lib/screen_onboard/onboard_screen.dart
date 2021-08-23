import '../core/navigation/routes/navigation_route.dart';
import '../core/navigation/services/navigation_service.dart';
import '../global/starting_files/injection_container.dart';
import '../main.dart';
import '../screen_home/home_screen.dart';
import 'components/onboard_navigate_button.dart';
import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';
import '../global/components/app_bar_components.dart';
import '../global/utils/custom_colors.dart';
import 'components/onboard_image_title_widget.dart';
import 'components/page_view_indicator.dart';
import 'view_model/onboard_screen_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';

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
      backgroundColor: context.colorScheme.primaryVariant,
      body: Column(
        children: [
          Spacer(flex: 10),
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
      description: "ONBOARD_SCREEN.DATA_NOTIFICATON_DESCRIPTION".tr(),
      image: "onboard_notify_image",
      title: "ONBOARD_SCREEN.DATA_NOTIFICATON_TITLE".tr(),
    ),
    OnboardScreenImageAndTitleWidget(
      description: "ONBOARD_SCREEN.DATA_CATEGORY_DESCRIPTION".tr(),
      image: "onboard_search_image",
      title: "ONBOARD_SCREEN.DATA_CATEGORY_TITLE".tr(),
    ),
    OnboardScreenImageAndTitleWidget(
      description: "ONBOARD_SCREEN.DATA_DETAIL_DESCRIPTION".tr(),
      image: "onboard_detail_image",
      title: "ONBOARD_SCREEN.DATA_DETAIL_TITLE".tr(),
    ),
    OnboardScreenImageAndTitleWidget(
      description: "ONBOARD_SCREEN.DATA_THEME_DESCRIPTION".tr(),
      image: "onboard_customize_image",
      title: "ONBOARD_SCREEN.DATA_THEME_TITLE".tr(),
    ),
  ];
}
