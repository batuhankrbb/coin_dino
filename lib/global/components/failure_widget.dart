import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
class FailureWidget extends StatelessWidget {
  const FailureWidget({Key? key, required this.onTryAgain}) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.getWidth(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 70,
            child: buildExplanationText(context),
          ),
          Spacer(
            flex: 3,
          ),
          Flexible(flex: 30, child: buildTryAgainButton(context)),
        ],
      ),
    );
  }

  Widget buildTryAgainButton(BuildContext context) {
    return GestureDetector(
      onTap: onTryAgain,
      child: SizedBox(
        width: context.getWidth(0.2),
        child: AutoSizeText(
          "Try again",
          style: TextStyle(color: Colors.blue, fontSize: 25),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }

  SizedBox buildExplanationText(BuildContext context) {
    return SizedBox(
      width: context.getWidth(0.9),
      child: AutoSizeText(
        "Oops, something went wrong, but be calm - let's give it another shot.",
        style: TextStyle(color: Colors.black, fontSize: 30),
        textAlign: TextAlign.center,
        minFontSize: 6,
        maxLines: 1,
      ),
    );
  }
}
