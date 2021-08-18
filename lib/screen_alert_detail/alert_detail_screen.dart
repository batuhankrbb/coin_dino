import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/mobile_ads/admob_ad_id_helper.dart';
import 'package:coin_dino/core/mobile_ads/admob_helper.dart';
import 'package:coin_dino/core/mobile_ads/admob_widget_helper.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_custom_textfield.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_detail_execute_button.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_detail_explanation_text.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_detail_header.dart';
import 'package:coin_dino/screen_alert_detail/viewmodels/screen_alert_view_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../global/components/app_bar_components.dart';
import '../global/components/cached_network_image.dart';

import '../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';

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
          title: "${widget.isUpdate ? "Update" : "Add"} Price Alert",
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
}
