import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';

class InappPurchaseTextWidget extends StatelessWidget {
  const InappPurchaseTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: buildTitle(context),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: buildDescription(context),
          ),
        ],
      ),
    );
  }

  Widget buildDescription(BuildContext context) {
    return AutoSizeText(
      "You can both remove all the ads on the app permanently and support us with 1\$",
      textAlign: TextAlign.center,
      maxLines: 2,
      style: TextStyle(
        color: context.colorScheme.background,
        fontSize: context.getWidth(0.045),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return AutoSizeText(
      "We know that ads are annoying. Aren't they?",
      maxLines: 2,
      style: TextStyle(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold,
        fontSize: context.getWidth(0.08),
      ),
      textAlign: TextAlign.center,
    );
  }
}
