import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_alert/viewmodels/screen_alert_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/alert_cell.dart';

class AlertListScreen extends StatefulWidget {
  AlertListScreen({Key? key}) : super(key: key);

  @override
  _AlertListScreenState createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  var alertViewModel = getit.get<ScreenAlertViewModel>();

  @override
  void initState() {
    super.initState();
    alertViewModel.setContext(context);
    alertViewModel.getAllAlerts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context,title: "Alerts"),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: buildAlertList(),
        ),
      ),
    );
  }

  Widget buildAlertList() {
    return Observer(
      builder: (context) {
        return StateResultBuilder<List<AlertEntity>>(
          stateResult: alertViewModel.alertResult,
          initialWidget: Text("NO DATA BLA BLA BLA ADD SOME ALERT BRO"),
          completedWidget: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return AlertCell(
                  alertEntity: data[index],
                );
              },
              itemCount: data.length,
            );
          },
          failureWidget: (failure) {
            return Text("FAILURE ${failure.message}");
          },
        );
      },
    );
  }
}
