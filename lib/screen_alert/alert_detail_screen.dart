import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/cached_network_image.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_alert/components/alert_custom_textfield.dart';
import 'package:coin_dino/screen_alert/viewmodels/screen_alert_view_model.dart';
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
      appBar: customAppBar(context: context, title: "Alert Detail"),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 15,
              child: buildHeaderWidget(),
            ),
            Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 10,
              child: AlertCustomTextField(
                alertEntity: widget.alertEntity,
                textEditingController: textEditingController,
              ),
            ),
            Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 20,
              child: buildInformationText(),
            ),
            Spacer(
              flex: 10,
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  child: AutoSizeText(
                    widget.isUpdate ? "UPDATE" : "SAVE",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: onSave,
                ),
              ),
            ),
            Spacer(
              flex: 30,
            )
          ],
        ),
      ),
    );
  }

  Container buildInformationText() {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: AutoSizeText(
        "When the price hits the target price, an alert will be sent you via app notification. To receive alerts, please allow your phone settings notification permission.",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget buildHeaderWidget() {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImageWidget(
            imageURL: widget.alertEntity.image,
            imageHeigth: 70,
            imageWidth: 70,
          ),
        ),
        Expanded(
          child: AutoSizeText(
            widget.alertEntity.name,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }

  void onSave() {
    double price = textEditingController.text == ""
        ? 0
        : double.parse(textEditingController.text);

    var entity = AlertEntity(
        coindID: widget.alertEntity.coindID,
        name: widget.alertEntity.name,
        image: widget.alertEntity.image,
        targetPrice: price,
        price: widget.alertEntity.price);

    if (widget.isUpdate) {
      alertViewModel.updateAlert(entity);
    } else {
      alertViewModel.addAlert(entity);
    }
  }
}
