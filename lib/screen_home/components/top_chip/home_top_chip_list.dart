import 'package:coin_dino/features/details/data/models/coin_detail_model.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_home/components/top_chip/top_home_chip.dart';
import 'package:coin_dino/screen_home/viewmodels/home_screen_view_model.dart';
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
            title: 'Set Interval',
          ),
          TopHomeChip(
            texts: categoryList.map((e) => e.categoryName).toList(),
            selectedIndex: 0,
            onTap: (i) {
              viewModel.selectedCategory = categoryList[i];
            },
            isBarActive: true,
            title: 'Set Category',
          ),
          TopHomeChip(
            texts: MarketSort.values.map((e) => e.displayValue).toList(),
            selectedIndex: 0,
            onTap: (i) {
              viewModel.marketSort = MarketSort.values[i];
            },
            title: 'Set Sort Order',
          ),
        ],
      );
  }
}