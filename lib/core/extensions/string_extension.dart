extension EasyString on String {
  String toCapitalCase() {
    var lowerCased = this.toLowerCase();
    return lowerCased[0].toUpperCase() + lowerCased.substring(1);
  }
}
