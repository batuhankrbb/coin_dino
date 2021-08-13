class ErrorHelper {
  static final shared = ErrorHelper._privateConstructor();

  ErrorHelper._privateConstructor();

  void printError(String errorLocation, Object e) {
    print("Error has occured in $errorLocation. ErrorString: ${e.toString()}");
  }
}
