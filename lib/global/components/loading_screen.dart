import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';
import '../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../utils/custom_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: context.getWidth(0.035),
      ),
    );
  }
}

