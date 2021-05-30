import '../../features/preferences/domain/entity/language_preference_entity.dart';
import '../../features/preferences/domain/entity/theme_preference_entity.dart';
import '../../features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'injection_container.dart';

Future<void> launchApp() async {
  var preferenceRepo = getit.get<IPreferenceRepository>();
  var baseCurrency = await preferenceRepo.getBaseCurrencyPreference();
  baseCurrency.when(success: (data) {
    print("not relaunch app");
  }, failure: (failure) async {
    print("relaunch app -1");
    await preferenceRepo.setBaseCurrencyPreference("usd");
    await preferenceRepo
        .setLangaugePreference(LanguagePreferenceEntity.english);
    await preferenceRepo.setThemePreference(ThemePreferenceEntity.light);
  });
  await Future.delayed(Duration(milliseconds: 500));
}
