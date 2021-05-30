import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Search"),
      body: Container(
        child: Column(
          children: [CupertinoTextField(controller: textController,onChanged: (value){
            //todo buraya istek vmden
          },)],
        ),
      ),
    );
  }
}
