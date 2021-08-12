import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class InfoUrlText extends StatelessWidget {
  const InfoUrlText({Key? key, required this.urlText}) : super(key: key);

  final String urlText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Divider(),
          Expanded(
            flex: 35,
            child: buildHomePageText(context),
          ),
          Spacer(
            flex: 20,
          ),
          Expanded(
            flex: 60,
            child: buildUrlText(context),
          ),
          Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }

  AutoSizeText buildHomePageText(BuildContext context) {
    return AutoSizeText(
      "Home Page",
      style: TextStyle(
          color: context.colorScheme.primary,
          fontSize: context.getWidth(0.04),
          fontWeight: FontWeight.w500),
      maxLines: 1,
    );
  }

  AutoSizeText buildUrlText(BuildContext context) {
    return AutoSizeText(
      urlText,
      maxLines: 1,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: context.colorScheme.surface,
        fontWeight: FontWeight.w500,
        fontSize: context.getWidth(0.04),
      ),
    );
  }
}
