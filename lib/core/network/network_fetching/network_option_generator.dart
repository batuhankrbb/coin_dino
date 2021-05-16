abstract class NetworkOptionsGenerator {
  const NetworkOptionsGenerator();
  String get networkPath;
  String get networkMethod;
  String get baseURL;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic>? get header;
}
