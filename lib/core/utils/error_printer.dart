class ErrorHelper {
 static ErrorHelper shared = ErrorHelper();

  void printError(String errorLocation, Object e) {
    print("Error has occured in $errorLocation. ErrorString: ${e.toString()}");
  }
}
