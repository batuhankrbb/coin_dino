import '../../../core/navigation/routes/navigation_route.dart';
import '../../../core/navigation/services/navigation_service.dart';
import '../../../features/details/domain/entity/coin_detail_entity.dart';
import '../../../global/components/state_result_builder.dart';
import '../../../global/starting_files/injection_container.dart';
import '../../../screen_alert/alert_detail_screen.dart';
import '../../viewmodels/detail_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/extensions/context_extensions.dart';

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
          color: context.colorScheme.primary,
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
