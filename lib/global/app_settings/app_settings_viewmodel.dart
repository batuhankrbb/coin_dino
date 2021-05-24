import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:mobx/mobx.dart';
part 'app_settings_viewmodel.g.dart';

class AppSettingsViewModel = _AppSettingsViewModelBase
    with _$AppSettingsViewModel;

abstract class _AppSettingsViewModelBase with Store {
  //final preferenceRepository = getit.get<PreferenceRepository>();
  // LanguagePreferenceEntity languagePreferenceEntity = LanguagePreferenceEntity.turkish;

}
