import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../features/details/data/models/coin_detail_model.dart';
import '../../../features/market/presentation/utils/listing_enums.dart';
import '../../../global/starting_files/injection_container.dart';
import 'top_home_chip.dart';
import '../../viewmodels/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class HomeTopChipList extends StatefulWidget {
  HomeTopChipList({Key? key}) : super(key: key);

  @override
  _HomeTopChipListState createState() => _HomeTopChipListState();
}

class _HomeTopChipListState extends State<HomeTopChipList> {
  var viewModel = getit.get<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: buildChild(),
      ),
    );
  }

  Row buildChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopHomeChip(
          texts: MarketDate.values.map((e) => e.displayValue).toList(),
          selectedIndex: 1,
          onTap: (i) {
            viewModel.marketDate = MarketDate.values[i];
          },
          title: 'HOME_SCREEN.INTERVAL_SELECTION_PAGE_TITLE'.tr(),
        ),
        buildCategoryChip(),
        TopHomeChip(
          texts: MarketSort.values.map((e) => e.displayValue).toList(),
          selectedIndex: 0,
          onTap: (i) {
            viewModel.marketSort = MarketSort.values[i];
          },
          title: 'HOME_SCREEN.ORDER_SELECTION_PAGE_TITLE'.tr(),
        ),
      ],
    );
  }

  Widget buildCategoryChip() {
    return Observer(builder: (context) {
      if (viewModel.categoryList.isEmpty) {
        return SizedBox();
      } else {
        return TopHomeChip(
          texts: viewModel.categoryList.map((e) => e.categoryName).toList(),
          selectedIndex: 0,
          onTap: (i) {
            viewModel.selectedCategory = viewModel.categoryList[i];
          },
          isBarActive: true,
          title: 'HOME_SCREEN.CATEGORY_SELECTION_PAGE_TITLE'.tr(),
        );
      }
    });
  }
}
