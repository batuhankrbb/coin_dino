import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {
  SettingsSwitch({Key? key, required this.onSwitch, required this.value})
      : super(key: key);

  Function(bool isActive) onSwitch;
  bool value;

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: widget.value,
        activeColor: Colors.pink[300],
        onChanged: (isActive) {
          widget.onSwitch(isActive);
          setState(() {
            widget.value = isActive;
          });
        });
  }
}
