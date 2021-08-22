import 'package:auto_size_text/auto_size_text.dart';
import '../global/components/loading_screen.dart';
import '../core/error_handling/custom_failure.dart';
import '../core/navigation/routes/navigation_route.dart';
import '../core/navigation/services/navigation_service.dart';
import '../global/components/failure_widget.dart';
import '../screen_detail/coin_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import '../core/extensions/context_extensions.dart';
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
  var _searchViewModel = getit.get<SearchScreenViewModel>();

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        _searchViewModel.isScrolled = true;
        _searchViewModel.getCoinNextPage();
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
        return _searchViewModel.getSearchCoins(value);
      },
    );
  }

  Widget buildList() {
    return Observer(
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: StateResultBuilder<List<SearchCoinEntity>>(
                stateResult: _searchViewModel.searchCoinsResult,
                failureWidget: buildFailureWidget,
                initialWidget: LoadingScreen(isSmallLoading: true,),
                completedWidget: buildCompletedListView,
              ),
            ),
            if (_searchViewModel.isScrolled) LoadingScreen(isSmallLoading: true,),
          ],
        );
      },
    );
  }

  Widget buildCompletedListView(List<SearchCoinEntity> data) {
    return Observer(
      builder: (_) {
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            return buildCell(index);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: _searchViewModel.searchCoinResultToShow.length,
        );
      },
    );
  }

  Widget buildCell(int index) {
    return SearchCell(
      searchCoinEntity: _searchViewModel.searchCoinResultToShow[index],
      onTap: () {
        NavigationService.shared.navigateTo(
          NavigationRoute.toDetails(
            CoinDetailScreen(
                coinID: _searchViewModel.searchCoinResultToShow[index].id),
          ),
        );
      },
    );
  }

  Widget buildFailureWidget(CustomFailure failure) {
    return FailureWidget(
      onTryAgain: () {
        _searchViewModel
            .getSearchCoins(_searchViewModel.textEditingController.text);
      },
    );
  }
}
