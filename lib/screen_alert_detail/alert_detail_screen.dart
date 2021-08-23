import 'package:auto_size_text/auto_size_text.dart';
import '../core/mobile_ads/admob_ad_id_helper.dart';
import '../core/mobile_ads/admob_helper.dart';
import '../core/mobile_ads/admob_widget_helper.dart';
import '../core/navigation/services/navigation_service.dart';
import '../features/alert/domain/entity/alert_entity.dart';
import 'components/alert_custom_textfield.dart';
import 'components/alert_detail_execute_button.dart';
import 'components/alert_detail_explanation_text.dart';
import 'components/alert_detail_header.dart';
import 'viewmodels/screen_alert_view_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../global/components/app_bar_components.dart';
import '../global/components/cached_network_image.dart';

import '../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/alert_detail_current_price_text.dart';

class AlertDetailScreen extends StatefulWidget {
  AlertDetailScreen(
      {Key? key, required this.alertEntity, required this.isUpdate})
      : super(key: key);

  @override
  _AlertDetailScreenState createState() => _AlertDetailScreenState();

  final AlertEntity alertEntity;
  final bool isUpdate;
}

class _AlertDetailScreenState extends State<AlertDetailScreen> {
  var alertViewModel = getit.get<ScreenAlertViewModel>();

  final BannerAd myBanner = AdmobHelper.shared
      .makeBannerAd(bannerID: AdmobIDHelper.shared.alertDetailScreenBannerID);

  @override
  void initState() {
    myBanner.load();
    super.initState();
    alertViewModel.setContext(context);
    alertViewModel.textEditingController.clear();
    if (widget.isUpdate) {
      alertViewModel.textEditingController.text =
          widget.alertEntity.targetPrice.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title:
             buildAppBarTitle(),
          showBackButton: true),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 18,
              child: AlertDetailHeader(
                imageUrl: widget.alertEntity.image,
                coinName: widget.alertEntity.name,
                symbol: widget.alertEntity.symbol,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 10,
              child: AlertCustomTextField(
                alertEntity: widget.alertEntity,
                isUpdate: widget.isUpdate,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 8,
              child: AlertDetailCurrentPriceText(
                  currentPrice: widget.alertEntity.currentPrice),
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 20,
              child: AlertDetailExplanationText(),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 6,
              child: AlertDetailExecuteButton(
                onTap: () {
                  if (widget.isUpdate) {
                    alertViewModel.updateAlert(entity: widget.alertEntity);
                  } else {
                    alertViewModel.addAlert(entity: widget.alertEntity);
                  }
                },
                isUpdate: widget.isUpdate,
              ),
            ),
            Spacer(
              flex: 14,
            ),
            buildBannerAd(),
          ],
        ),
      ),
    );
  }

  Widget buildBannerAd() {
    return AdmobWidgetHelper.shared.buildBannerAdWidget(myBanner);
  }

  String buildAppBarTitle() {
    var updateOrAddText = widget.isUpdate
        ? "ALERT_DETAIL_SCREEN_APP_BAR_TITLE_UPDATE".tr()
        : "ALERT_DETAIL_SCREEN_APP_BAR_TITLE_ADD".tr();
    var fullAppBarTitle =
        "ALERT_DETAIL_SCREEN_APP_BAR_TITLE_FULL".tr(args: [updateOrAddText]);
    return fullAppBarTitle;
  }
}
