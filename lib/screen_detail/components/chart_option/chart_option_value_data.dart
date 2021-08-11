class ChartOptionValue {
  final String name;
  final String value;

  ChartOptionValue({required this.name, required this.value});

  static List<ChartOptionValue> chartValues = [
    ChartOptionValue(name: "24H", value: "1"),
    ChartOptionValue(name: "3D", value: "3"),
    ChartOptionValue(name: "7D", value: "7"),
    ChartOptionValue(name: "15D", value: "15"),
    ChartOptionValue(name: "1M", value: "30"),
    ChartOptionValue(name: "MAX", value: "max"),
  ];
}
