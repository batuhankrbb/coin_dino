import 'package:flutter/material.dart';

class HomeTableHeader extends StatefulWidget {
  HomeTableHeader({Key? key}) : super(key: key);

  @override
  _HomeTableHeaderState createState() => _HomeTableHeaderState();
}

class _HomeTableHeaderState extends State<HomeTableHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(4),
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
