import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_alert/alert_detail_screen.dart';
import 'package:coin_dino/screen_detail/viewmodels/detail_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class DetailAppBarActions extends StatelessWidget {
  DetailAppBarActions({Key? key}) : super(key: key);

  var _detailViewModel = getit.get<DetailScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return StateResultBuilder<CoinDetailEntity>(
          stateResult: _detailViewModel.coinDetailResult,
          completedWidget: (data) {
            return buildCompletedWidget(data, context);
          },
          failureWidget: (_) {
            return SizedBox();
          },
          loadingWidget: SizedBox(),
        );
      },
    );
  }

  Widget buildCompletedWidget(CoinDetailEntity data, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: IconButton(
        icon: Icon(
          Icons.add_alarm,
          color: Colors.black,
          size: context.getHeight(0.033),
        ),
        onPressed: () {
          navigateToAlertDetail(data);
        },
      ),
    );
  }

  void navigateToAlertDetail(CoinDetailEntity data) {
    NavigationService.shared.navigateTo(
      NavigationRoute.toAlert(
        AlertDetailScreen(
          isUpdate: false,
          alertEntity: data.toAlertEntity(),
        ),
      ),
    );
  }
}