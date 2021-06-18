import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:flutter/material.dart';

class AlertCustomTextField extends StatefulWidget {
  AlertCustomTextField(
      {Key? key,
      required this.alertEntity,
      required this.textEditingController})
      : super(key: key);

  @override
  _AlertCustomTextFieldState createState() => _AlertCustomTextFieldState();

  AlertEntity alertEntity;
  TextEditingController textEditingController;
}

class _AlertCustomTextFieldState extends State<AlertCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Divider(),
          ),
          Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 95,
            child: buildRow(),
          ),
          Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 1,
            child: Divider(),
          ),
        ],
      ),
    );
  }

  Widget buildRow() {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 20,
          child: buildAlertText(),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: buildEqualText(),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 45,
          child: TextField(
            keyboardType: TextInputType.number,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 15,
          child: buildCurrencyText(),
        ),
      ],
    );
  }

  AutoSizeText buildAlertText() {
    return AutoSizeText(
      "1 ${widget.alertEntity.coindID.toUpperCase()}",
      style: TextStyle(fontSize: 20),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  AutoSizeText buildEqualText() {
    return AutoSizeText(
      "=",
      style: TextStyle(
          fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  AutoSizeText buildCurrencyText() {
    return AutoSizeText(
      "USD",
      style: TextStyle(
        fontSize: 20,
      ),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }
}
