import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/global/components/failure_widget.dart';
import 'package:coin_dino/screen_detail/coin_detail_screen.dart';
import 'package:flutter/cupertino.dart';

import '../features/search/domain/entity/search_coin_entity.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'viewmodels/search_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/debouncing_text_field.dart';
import 'components/search_cell.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchViewModel = getit.get<SearchScreenViewModel>();

  late TextEditingController textController;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        searchViewModel.getCoinNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 6,
          child: buildTextField(),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 50,
          child: buildList(),
        ),
      ],
    );
  }

  Widget buildTextField() {
    return DebouncingTextField(
      onChange: (value) {
        return searchViewModel.getSearchCoins(value);
      },
      textEditingController: textController,
    );
  }

  Widget buildList() {
    return Observer(
      builder: (context) {
        return StateResultBuilder<List<SearchCoinEntity>>(
          stateResult: searchViewModel.searchCoinsResult,
          failureWidget: (failure) {
            return FailureWidget(
              onTryAgain: () {
                print(textController.text);
                searchViewModel.getSearchCoins(textController.text);
              },
            );
          },
          initialWidget: CupertinoActivityIndicator(),
          completedWidget: (data) {
            return Observer(builder: (_) {
              return ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return SearchCell(
                    searchCoinEntity:
                        searchViewModel.searchCoinResultToShow[index],
                    onTap: () {
                      NavigationService.shared.navigateTo(
                          NavigationRoute.toDetails(
                              CoinDetailScreen(coinID: data[index].id)));
                    },
                  );
                },
                itemCount: searchViewModel.searchCoinResultToShow.length,
              );
            });
          },
        );
      },
    );
  }
}
