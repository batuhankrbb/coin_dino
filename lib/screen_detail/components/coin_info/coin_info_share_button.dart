import '../../../global/starting_files/injection_container.dart';
import '../../viewmodels/detail_screen_view_model.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extensions.dart';

class CoinInfoShareButton extends StatelessWidget {
  CoinInfoShareButton({Key? key, required this.coinName}) : super(key: key);

  var detailViewModel = getit.get<DetailScreenViewModel>();

  String coinName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        detailViewModel.shareCoin(coinName);
      },
      child: Container(
        padding: EdgeInsets.only(right: context.getWidth(0.03)),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.ios_share,
          size: context.getHeight(0.030),
          color: context.colorScheme.secondary,
        ),
      ),
    );
  }
}
