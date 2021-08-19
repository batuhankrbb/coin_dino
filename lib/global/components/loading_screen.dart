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
      return CupertinoActivityIndicator();
    } else {
      return CupertinoActivityIndicator(radius: context.getWidth(0.035));
    }
  }
}
