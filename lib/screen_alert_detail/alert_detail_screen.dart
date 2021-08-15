import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_custom_textfield.dart';
import 'package:coin_dino/screen_alert_detail/components/alert_detail_header.dart';
import 'package:coin_dino/screen_alert_list/viewmodels/screen_alert_view_model.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/cached_network_image.dart';
import '../global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';

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
  late TextEditingController textEditingController;
  var alertViewModel = getit.get<ScreenAlertViewModel>();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: "Add Price Alert", showBackButton: true),
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
            Expanded(
              flex: 12,
              child: Container(
                color: Colors.green,
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 11,
              child: AlertCustomTextField(
                alertEntity: widget.alertEntity,
                textEditingController: textEditingController,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.cyan,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Expanded(
              flex: 20,
              child: Container(
                color: Colors.black,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            Expanded(
              flex: 13,
              child: Container(
                color: Colors.pink,
              ),
            ),
            Spacer(
              flex: 17,
            )
          ],
        ),
      ),
    );
  }
}
