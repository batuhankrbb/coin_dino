import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../utils/custom_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, this.isSmallLoading = false})
      : super(key: key);

  final bool isSmallLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildLoadingWidget(context),
    );
  }

  Widget buildLoadingWidget(BuildContext context) {
    if (isSmallLoading) {
      return _widgetWithBrightness(CupertinoActivityIndicator(), context);
    } else {
      return _widgetWithBrightness(CupertinoActivityIndicator(radius: context.getWidth(0.035)), context);
    }
  }

  Widget _widgetWithBrightness(Widget widget,BuildContext context){
      return Theme(
        data: ThemeData(
            cupertinoOverrideTheme:
                CupertinoThemeData(brightness: context.colorScheme.brightness)),
        child: widget,
      );
  }
}
