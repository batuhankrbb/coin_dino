import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:flutter/services.dart';

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
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Divider(),
          ),
          Expanded(
            flex: 95,
            child: buildRow(),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 18,
          child: buildAlertText(),
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
          child: buildTextField(),
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

  TextField buildTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]'),
        )
      ],
      focusNode: focusNode,
      style: TextStyle(fontSize: context.getWidth(0.04)),
    );
  }

  AutoSizeText buildAlertText() {
    return AutoSizeText(
      "1 ${widget.alertEntity.symbol.toUpperCase()}",
      style: TextStyle(fontSize: context.getWidth(0.05)),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  AutoSizeText buildEqualText() {
    return AutoSizeText(
      "=",
      style: TextStyle(
          fontSize: context.getWidth(0.06),
          color: Colors.green,
          fontWeight: FontWeight.bold),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  AutoSizeText buildCurrencyText() {
    return AutoSizeText(
      "USD",
      style: TextStyle(
        fontSize: context.getWidth(0.05),
      ),
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }
}
