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
      child: Container(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height * 1.2,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: buildHomePage(),
              ),
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 80,
                child: CustomAutoSizeText(
                  text: widget.data.description,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              )
            ],
          ),
        ),
      )),
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
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(
            flex: 20,
          ),
          Expanded(
            flex: 50,
            child: AutoSizeText(
              widget.data.homePageUrl,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
