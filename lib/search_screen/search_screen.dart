import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/search_screen/components/debouncing_text_field.dart';
import 'package:coin_dino/search_screen/components/search_cell.dart';
import 'package:coin_dino/search_screen/viewmodels/search_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
              child: DebouncingTextField(
                onChange: (value) {
                  return searchViewModel.getSearchCoins(value);
                },
                textEditingController: textController,
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 50,
              child: Observer(
                builder: (context) {
                  return StateResultBuilder<List<SearchCoinEntity>>(
                    stateResult: searchViewModel.searchCoinsResult,
                    failureWidget: (failure) {
                      return Text("fail");
                    },
                    initialWidget: Text("Burada daha bir şey olmamış"),
                    completedWidget: (data) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return SearchCell(searchCoinEntity: data[index]);
                        },
                        itemCount: data.length,
                      );
                    },
                  );
                },
              ),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
