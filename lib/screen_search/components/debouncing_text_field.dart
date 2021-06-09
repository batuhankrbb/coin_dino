import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        controller: textEditingController,
        prefix: Container(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.search),
        ),
        onChanged: (value) {
          if (_debounce?.isActive ?? false) {
            _debounce?.cancel();
          }
          _debounce = Timer(Duration(milliseconds: 500), () {
            onChange(value);
          }); 
        },
      ),
    );
  }
}
