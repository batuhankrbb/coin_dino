import 'package:easy_localization/easy_localization.dart';

class ChartOptionValue {
  final String name;
  final String value;

  ChartOptionValue({required this.name, required this.value});

  static List<ChartOptionValue> chartValues = [
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_24H_TEXT".tr(), value: "1"),
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_3D_TEXT".tr(), value: "3"),
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_7D_TEXT".tr(), value: "7"),
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_15D_TEXT".tr(), value: "15"),
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_1M_TEXT".tr(), value: "30"),
    ChartOptionValue(
        name: "DETAIL_SCREEN.CHART_OPTION_VALUE_MAX_TEXT".tr(), value: "max"),
  ];
}
