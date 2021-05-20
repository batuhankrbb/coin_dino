enum ThemePreferenceEntity { dark, light }

extension UltraThemePreferenceEntity on ThemePreferenceEntity {
  String get rawValue {
    switch (this) {
      case ThemePreferenceEntity.light:
        return "light";
      case ThemePreferenceEntity.dark:
        return "dark";
    }
  }
}

extension ThemePreferenceForString on String {
  ThemePreferenceEntity toThemePrerence() {
    switch (this) {
      case "light":
        return ThemePreferenceEntity.light;
      case "dark":
        return ThemePreferenceEntity.dark;
      default:
        return ThemePreferenceEntity.light;
    }
  }
}
