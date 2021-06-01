import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/search_screen/viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/components/app_bar_components.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchViewModel = getit.get<SearchScreenViewModel>();

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Search"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: buildTextField(),
                ),
                Spacer(
                  flex: 5,
                ),
                Expanded(
                  flex: 50,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text("test");
                    },
                    itemCount: 10,
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            )
            ,
      ),
    );
  }

  Container buildTextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: CupertinoTextField(
        controller: textController,
        prefix: Container(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.search),
        ),
        onChanged: (value) {
          searchViewModel.getSearchCoins(value);
        },
      ),
    );
  }
}
