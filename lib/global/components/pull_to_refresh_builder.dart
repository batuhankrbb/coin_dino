import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshBuilder extends StatefulWidget {
  PullToRefreshBuilder({Key? key}) : super(key: key);

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
      onLoading: () {
        print("ONLOADING TRIGGERED");
      },
      onRefresh: (){
        print("ONREFRESH TRIGGERED");
      },
     child: Container(color: Colors.red,),
     header: Container(color: Colors.green,),
    );
  }
}
