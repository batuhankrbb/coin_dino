import 'package:coin_dino/features/global/extensions/helper_extensions.dart';

import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: context.borderRadiusAll(10),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 1,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        )
      ],
    );
  }
}
