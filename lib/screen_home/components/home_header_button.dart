import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomeHeaderButton extends StatefulWidget {
  HomeHeaderButton({Key? key, required this.text}) : super(key: key);

  @override
  _HomeHeaderButtonState createState() => _HomeHeaderButtonState();

  final String text;
}

class _HomeHeaderButtonState extends State<HomeHeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Colors.red,
              child: Icon(Icons.arrow_drop_up),
            ),
          ),
          Expanded(
            flex: 20,
            child: Center(
              child: AutoSizeText(
                widget.text,
                style: TextStyle(color: Colors.black, fontSize: 20),
                maxLines: 1,
                minFontSize: 8,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
AutoSizeText(
              widget.text,
              style: TextStyle(color: Colors.black),
              maxLines: 1,
              minFontSize: 8,
              textAlign: TextAlign.center,
            )
*/
