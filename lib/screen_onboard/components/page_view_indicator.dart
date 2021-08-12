import '../../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/extensions/context_extensions.dart';
import '../../global/utils/custom_colors.dart';
import '../view_model/onboard_screen_viewmodel.dart';

class PageViewIndicatorWidget extends StatelessWidget {
  final int index;
  PageViewIndicatorWidget({Key? key, required this.index}) : super(key: key);

  var onBoardScreenViewModel = getit.get<OnboardScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedContainer(
          width: onBoardScreenViewModel.selectedIndex == index
              ? context.getWidth(0.1)
              : context.getWidth(0.06),
          height: 1,
          duration: Duration(milliseconds: 100),
          decoration: buildBoxDecoration(context),
        );
      },
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: (onBoardScreenViewModel.selectedIndex == index)
          ? context.colorScheme.secondary
          : context.colorScheme.background,
    );
  }
}
