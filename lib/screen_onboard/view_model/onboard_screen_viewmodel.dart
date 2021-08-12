import '../components/onboard_image_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';



part 'onboard_screen_viewmodel.g.dart';

class OnboardScreenViewModel = _OnboardScreenViewModelBase
    with _$OnboardScreenViewModel;

abstract class _OnboardScreenViewModelBase with Store {
  @observable
  int selectedIndex = 0;
  

}
