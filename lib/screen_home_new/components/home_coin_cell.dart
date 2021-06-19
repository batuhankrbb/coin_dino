import 'package:flutter/material.dart';

class HomeCoinCell extends StatelessWidget {
  const HomeCoinCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 60,
      child: Row(
        children: [
          Expanded(
            flex: 11,
            child: Container(
              color: Colors.blue[300],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.pink[300],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 26,
            child: Container(
              color: Colors.green[300],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.yellow[300],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 30,
            child: Container(
              color: Colors.red[300],
            ),
          ),
        ],
      ),
    );
  }
}
