import 'package:coin_dino/global/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//TODO GELİNCE DEVAM EDİCEM
class PullToRefreshBuilder extends StatefulWidget {
  PullToRefreshBuilder(
      {Key? key,
      this.onLoading,
      required this.onRefresh,
      required this.listView})
      : super(key: key);

  VoidFutureCallBack? onLoading;
  VoidFutureCallBack onRefresh;
  ListView listView;

  @override
  _PullToRefreshBuilderState createState() => _PullToRefreshBuilderState();
}

class _PullToRefreshBuilderState extends State<PullToRefreshBuilder> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      enablePullUp: false,
      enablePullDown: true,
      enableTwoLevel: false,
      onLoading: widget.onLoading,
      onRefresh: () async {
        await widget.onRefresh();
        refreshController.refreshCompleted();
      },
      child: widget.listView,
      header: WaterDropHeader(
        waterDropColor: CustomColor.shared.backgroundBlueColor,
        refresh: CupertinoActivityIndicator(),
        failed: Text("failed"),
      ),
    );
  }
}
