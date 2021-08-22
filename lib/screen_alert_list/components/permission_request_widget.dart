import 'package:auto_size_text/auto_size_text.dart';
import '../../global/starting_files/injection_container.dart';
import '../../screen_alert_detail/viewmodels/screen_alert_view_model.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class PermissionRequestWidget extends StatefulWidget {
  PermissionRequestWidget({Key? key, required this.visible, required this.onTap}) : super(key: key);

  bool visible;
  VoidCallback onTap;

  @override
  _PermissionRequestWidgetState createState() =>
      _PermissionRequestWidgetState();
}

class _PermissionRequestWidgetState extends State<PermissionRequestWidget> {


  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.visible, child: buildPermissionWidget(context));
  }

  Widget buildPermissionWidget(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: context.getHeight(0.1),
        alignment: Alignment.center,
        color: context.colorScheme.primaryVariant,
        padding: EdgeInsets.symmetric(
            horizontal: context.getWidth(0.03),
            vertical: context.getWidth(0.01)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: buildTextsColumn(context),
            ),
            Expanded(
              flex: 1,
              child: buildTrailing(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextsColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: buildTitle(context)),
        Flexible(
          child: buildSubtitle(context),
        )
      ],
    );
  }

  Widget buildTrailing(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.notifications,
        size: context.getHeight(0.025),
      ),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      "Turn on notifications",
      style: TextStyle(
        fontSize: context.getWidth(0.05),
      ),
      textAlign: TextAlign.start,
      maxLines: 1,
    );
  }

  AutoSizeText buildSubtitle(BuildContext context) {
    return AutoSizeText(
      "We noticed that you didn't give us permission to do that. Please click here turn on your notifications.",
      style: TextStyle(
        fontSize: context.getWidth(0.03),
      ),
      textAlign: TextAlign.start,
      minFontSize: 8,
      maxLines: 2,
    );
  }
}
