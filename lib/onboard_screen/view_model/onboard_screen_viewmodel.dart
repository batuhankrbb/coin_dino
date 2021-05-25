import 'package:coin_dino/onboard_screen/widgets/onboard_image_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'onboard_screen_viewmodel.g.dart';

class OnboardScreenViewModel = _OnboardScreenViewModelBase
    with _$OnboardScreenViewModel;

abstract class _OnboardScreenViewModelBase with Store {
  @observable
  int selectedIndex = 0;

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
