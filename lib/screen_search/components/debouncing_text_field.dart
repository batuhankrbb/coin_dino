import 'dart:async';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DebouncingTextField extends StatelessWidget {
  DebouncingTextField(
      {Key? key, required this.onChange, required this.textEditingController})
      : super(key: key);

  final Function(String value) onChange;
  final TextEditingController textEditingController;

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        controller: textEditingController,
        prefix: buildLeadingIcon(context),
        onChanged: _doDebouncedOnChange,
      ),
    );
  }

  Container buildLeadingIcon(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: context.getHeight(0.015), right: 4),
        child: Icon(
          Icons.search,
          size: context.getWidth(0.05),
        ),
      );
  }

  void _doDebouncedOnChange(String value){
  if (_debounce?.isActive ?? false) {
            _debounce?.cancel();
          }
          _debounce = Timer(Duration(milliseconds: 500), () {
            onChange(value);
          });
  }
}
