import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/core/permission/permission_helper.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/global/components/failure_widget.dart';
import 'package:coin_dino/global/utils/global_keys.dart';
import 'package:coin_dino/screen_alert_detail/alert_detail_screen.dart';
import 'package:coin_dino/screen_alert_detail/viewmodels/screen_alert_view_model.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:coin_dino/screen_alert_list/components/alert_list_no_alert_widget.dart';
import 'package:coin_dino/screen_alert_list/components/permission_request_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/alert_cell/alert_cell.dart';
import 'components/alert_list_app_bar.dart';

class AlertListScreen extends StatefulWidget {
  AlertListScreen({Key? key}) : super(key: key);

  @override
  _AlertListScreenState createState() => _AlertListScreenState();
}

class _AlertListScreenState extends State<AlertListScreen> {
  var alertViewModel = getit.get<ScreenAlertViewModel>();

  var isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    alertViewModel.setContext(context);
    alertViewModel.getAllAlerts();
    checkPermission(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKeys.shared.scaffoldKey,
      appBar: alertListAppBar(context),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              PermissionRequestWidget(
                visible: !isPermissionGranted,
                onTap: () {
                  checkPermission(true);
                },
              ),
              Expanded(
                flex: 15,
                child: buildAlertList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAlertList() {
    return Observer(
      builder: (context) {
        return StateResultBuilder<List<AlertEntity>>(
          stateResult: alertViewModel.alertResult,
          initialWidget: AlertListNoAlertWidget(),
          completedWidget: buildCompletedWidget,
          failureWidget: buildFailureWidget,
        );
      },
    );
  }

  Widget buildFailureWidget(failure) {
    return FailureWidget(onTryAgain: () {
      alertViewModel.getAllAlerts();
    });
  }

  Widget buildCompletedWidget(data) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var currentAlert = alertViewModel.alertListToShow[index];
        return buildAlertCell(currentAlert);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: alertViewModel.alertListToShow.length,
    );
  }

  AlertCell buildAlertCell(AlertEntity currentAlert) {
    return AlertCell(
      alertEntity: currentAlert,
      onTap: () {
        navigateToAlertDetails(currentAlert);
      },
      onDismiss: (i) {
        alertViewModel.deleteAlert(entity: currentAlert);
        setState(() {});
      },
    );
  }

  void navigateToAlertDetails(AlertEntity currentAlert) {
    NavigationService.shared.navigateTo(
      NavigationRoute.toAlert(
        AlertDetailScreen(
          alertEntity: currentAlert,
          isUpdate: true,
        ),
      ),
    );
  }

  void checkPermission(bool withRequest) {
    alertViewModel
        .checkAlertPermissions(withRequest: withRequest)
        .then((value) {
      setState(() {
        isPermissionGranted = value;
      });
    });
  }
}
