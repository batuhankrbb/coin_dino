import 'package:auto_size_text/auto_size_text.dart';
import '../features/details/domain/entity/coin_detail_entity.dart';
import '../global/components/custom_autosize_text.dart';
import '../global/starting_files/injection_container.dart';
import 'viewmodels/detail_screen_view_model.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              Flexible(
                flex: 4,
                child: buildHomePage(),
              ),
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              Flexible(
                flex: 60,
                child: CustomAutoSizeText(
                  text: widget.data.description,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              Flexible(
                flex: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHomePage() {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Divider(),
          Expanded(
            flex: 35,
            child: AutoSizeText(
              "Home Page",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
            ),
          ),
          Spacer(
            flex: 20,
          ),
          Expanded(
            flex: 60,
            child: AutoSizeText(
              widget.data.homePageUrl,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
