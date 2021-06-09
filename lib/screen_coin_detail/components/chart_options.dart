import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_coin_detail/viewmodels/detail_screen_view_model.dart';
import 'package:flutter/material.dart';

class ChartOptions extends StatefulWidget {
  ChartOptions({Key? key, required this.coinID}) : super(key: key);

  @override
  _ChartOptionsState createState() => _ChartOptionsState();

  final String coinID;
}

class _ChartOptionsState extends State<ChartOptions>
    with AutomaticKeepAliveClientMixin {
  var selectedIndex = 0;

  var detailViewModel = getit.get<DetailScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ChartOptionValue.chartValues.map(
        (value) {
          var index = ChartOptionValue.chartValues.indexOf(value);
          return Expanded(
            child: ChartOptionCell(
              value: value,
              isSelected: index == selectedIndex,
              index: index,
              onTap: () {
                detailViewModel.getCharts(
                    coinID: widget.coinID, days: value.value);
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

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

class ChartOptionCell extends StatelessWidget {
  ChartOptionCell(
      {Key? key,
      required this.value,
      required this.isSelected,
      required this.index,
      required this.onTap})
      : super(key: key);

  final ChartOptionValue value;
  final bool isSelected;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[400] : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: AutoSizeText(
          value.name,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
