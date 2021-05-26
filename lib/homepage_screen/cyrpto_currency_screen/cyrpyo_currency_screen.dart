import 'package:flutter/material.dart';

class CyrptoCurrencyScreen extends StatelessWidget {
  const CyrptoCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: ListView.builder(
        itemBuilder: (context, index) {
          return [
        DataColumn(label: Expanded(child: Text("#")), numeric: true),
        DataColumn(label: Expanded(child: Text("Coin")), numeric: true),
        DataColumn(label: Expanded(child: Text("Price")), numeric: true),
        DataColumn(label: Expanded(child: Text("24 Saat")), numeric: true),
        DataColumn(label: Expanded(child: Text("Market Cap")), numeric: true),
      ]; 
        },
      ),
      rows: [
        DataRow(
          cells: [
            DataCell(Text("1")),
            DataCell(Text("dsada")),
            DataCell(Text("dsada")),
            DataCell(Text("dsada")),
            DataCell(Text("dsada")),
          ],
        ),
      ],
    );
  }
}
