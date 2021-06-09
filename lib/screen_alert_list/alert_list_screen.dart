import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:flutter/material.dart';

import 'components/alert_cell.dart';

class AlertListScreen extends StatefulWidget {
  AlertListScreen({Key? key}) : super(key: key);

  @override
  _AlertListScreenState createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Alerts"),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: AlertCell(
            
          ),
        ),
      ),
    );
  }
}

