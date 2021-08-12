import 'package:auto_size_text/auto_size_text.dart';
import '../features/details/domain/entity/coin_detail_entity.dart';
import '../global/starting_files/injection_container.dart';
import 'components/info_url_text.dart';
import 'viewmodels/detail_screen_view_model.dart';
import '../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CoinDetailsInfo extends StatefulWidget {
  CoinDetailsInfo({Key? key, required this.data}) : super(key: key);

  @override
  _CoinDetailsInfoState createState() => _CoinDetailsInfoState();

  final CoinDetailEntity data;
}

class _CoinDetailsInfoState extends State<CoinDetailsInfo> {
  var _detailViewModel = getit.get<DetailScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _detailViewModel.openWebPage(widget.data.homePageUrl);
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: context.getWidth(0.03)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(height: context.getHeight(0.03)),
              ),
              Flexible(
                child: Divider(),
              ),
              Flexible(
                flex: 4,
                child: InfoUrlText(urlText: widget.data.homePageUrl),
              ),
              Flexible(
                child: Divider(),
              ),
              Flexible(
                flex: 4,
                child: SizedBox(height: context.getHeight(0.03)),
              ),
              Flexible(
                flex: 60,
                child: buildDescriptionText(),
              ),
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDescriptionText() {
    return AutoSizeText(
        widget.data.description,
minFontSize: 14,
      style: TextStyle(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.w400,
        fontSize: context.getWidth(0.035),
      ),
    );
  }
}
