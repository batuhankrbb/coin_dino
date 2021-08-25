enum ThemePreferenceEntity { dark, light, red, yellow }

extension UltraThemePreferenceEntity on ThemePreferenceEntity {
  String get rawValue {
    switch (this) {
      case ThemePreferenceEntity.light:
        return "light";
      case ThemePreferenceEntity.dark:
        return "dark";
      case ThemePreferenceEntity.red:
        return "red";
      case ThemePreferenceEntity.yellow:
        return "yellow";
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
      case "red":
        return ThemePreferenceEntity.red;
      case "yellow":
        return ThemePreferenceEntity.yellow;
      default:
        return ThemePreferenceEntity.light;
    }
  }
}
