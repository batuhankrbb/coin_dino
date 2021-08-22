enum LanguagePreferenceEntity { english, turkish, spanish, french }

extension UltraLanguagePreferenceEntity on LanguagePreferenceEntity {
  String get rawValue {
    switch (this) {
      case LanguagePreferenceEntity.english:
        return "english";
      case LanguagePreferenceEntity.turkish:
        return "turkish";
      case LanguagePreferenceEntity.spanish:
        return "spanish";
      case LanguagePreferenceEntity.french:
        return "french";
    }
  }
}

extension LanguagePreferenceForString on String {
  LanguagePreferenceEntity toLanguagePreference() {
    switch (this) {
      case "english":
        return LanguagePreferenceEntity.english;
      case "turkish":
        return LanguagePreferenceEntity.turkish;
      case "spanish":
        return LanguagePreferenceEntity.spanish;
      case "french":
        return LanguagePreferenceEntity.french;
      default:
        return LanguagePreferenceEntity.english;
    }
  }
}
