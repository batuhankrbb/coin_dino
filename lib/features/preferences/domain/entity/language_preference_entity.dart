enum LanguagePreferenceEntity { turkish, english }

extension UltraLanguagePreferenceEntity on LanguagePreferenceEntity {
  String get rawValue {
    switch (this) {
      case LanguagePreferenceEntity.english:
        return "english";
      case LanguagePreferenceEntity.turkish:
        return "turkish";
    }
  }
}

extension LanguagePreferenceForString on String {
  LanguagePreferenceEntity toLanguagePrerence() {
    switch (this) {
      case "english":
        return LanguagePreferenceEntity.english;
      case "turkish":
        return LanguagePreferenceEntity.turkish;
      default:
        return LanguagePreferenceEntity.english;
    }
  }
}