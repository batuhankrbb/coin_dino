import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../core/user_interface/helpers/alert_helper.dart';
import '../utils/custom_colors.dart';

class PullToRefreshBuilder extends StatefulWidget {
  PullToRefreshBuilder(
      {Key? key,
      this.onLoading,
      required this.onRefresh,
      required this.listView,
      required this.snackMessage})
      : super(key: key);

  VoidFutureCallBack? onLoading;
  VoidFutureCallBack onRefresh;
  ListView listView;
  String snackMessage;

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
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

//TODO Snackbar göster

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
        AlertHelper.shared.showSnackBar(widget.snackMessage, context);
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
