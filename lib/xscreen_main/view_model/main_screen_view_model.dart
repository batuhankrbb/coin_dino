import 'package:mobx/mobx.dart';
part 'main_screen_view_model.g.dart';

class MainScreenViewModel = _MainScreenViewModelBase with _$MainScreenViewModel;

abstract class _MainScreenViewModelBase with Store {
  @observable
  int selectedIndex = 0;
}
