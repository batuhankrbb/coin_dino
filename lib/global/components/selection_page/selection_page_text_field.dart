import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/extensions/context_extensions.dart';

class SelectionPageTextField extends StatefulWidget {
  const SelectionPageTextField({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  _SelectionPageTextFieldState createState() => _SelectionPageTextFieldState();

  final TextEditingController textEditingController;
}

class _SelectionPageTextFieldState extends State<SelectionPageTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: context.colorScheme.primaryVariant,
        child: buildTextFieldRow(),
      ),
    );
  }

  Row buildTextFieldRow() {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Icon(
            Icons.search,
            color: context.colorScheme.primary,
            size: context.getHeight(0.028),
          ),
        ),
        Expanded(
          flex: 70,
          child: buildTextField(),
        ),
        Expanded(
          flex: 20,
          child: buildCancelButtonForTextfield(),
        )
      ],
    );
  }

  Visibility buildCancelButtonForTextfield() {
    return Visibility(
        child: TextButton(
          onPressed: () {
            focusNode.unfocus();
            widget.textEditingController.clear();
          },
          child: AutoSizeText(
            "GLOBAL_COMPONENT.SELECTION_PAGE_TEXTFIELD_CANCEL_TEXT".tr(),
            style: TextStyle(
              color: context.colorScheme.onBackground,
              fontSize: context.getWidth(0.035),
            ),
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        visible: widget.textEditingController.text != "");
  }

  TextField buildTextField() {
    return TextField(
      focusNode: focusNode,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      style: TextStyle(color: context.colorScheme.primary),
      cursorColor: context.colorScheme.primary,
    );
  }
}
