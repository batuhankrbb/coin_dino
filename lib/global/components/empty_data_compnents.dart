
import 'package:flutter/material.dart';

class EmptyDataComponents extends StatelessWidget {
  const EmptyDataComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: NoDataCardWidget(),
        ),
      ),
    );
  }
}

class NoDataCardWidget extends StatelessWidget {
  const NoDataCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          clipBehavior: Clip.none,
          width: 180,
          height: 210,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          clipBehavior: Clip.none,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
