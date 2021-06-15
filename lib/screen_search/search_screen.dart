import 'package:coin_dino/core/navigation/routes/navigation_route.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/screen_detail/coin_detail_screen.dart';

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

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 4,
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
            return Text("fail");
          },
          initialWidget: Text("Burada daha bir şey olmamış"),
          completedWidget: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return SearchCell(
                  searchCoinEntity: data[index],
                  onTap: () {
                    NavigationService.shared.navigateTo(
                        NavigationRoute.toDetails(
                            CoinDetailScreen(coinID: data[index].id)));
                  },
                );
              },
              itemCount: data.length,
            );
          },
        );
      },
    );
  }
}
