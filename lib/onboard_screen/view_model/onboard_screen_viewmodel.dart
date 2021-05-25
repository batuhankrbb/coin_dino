import 'package:coin_dino/onboard_screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'onboard_screen_viewmodel.g.dart';

class OnboardScreenViewModel = _OnboardScreenViewModelBase
    with _$OnboardScreenViewModel;

abstract class _OnboardScreenViewModelBase with Store {
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
      image: "onboard_notify_image",
      title: "Detay Sayfası",
    ),
    OnboardScreenImageAndTitleWidget(
      description: "dasdsadasdas",
      image: "onboard_notify_image",
      title: "Renkli Tema",
    ),
  ];
}
