import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:flutter/material.dart';

class AlertDetailScreen extends StatefulWidget {
  AlertDetailScreen({Key? key, required this.alertEntity, required this.isUpdate}) : super(key: key);

  @override
  _AlertDetailScreenState createState() => _AlertDetailScreenState();

  final AlertEntity alertEntity;
  final bool isUpdate;
}

class _AlertDetailScreenState extends State<AlertDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
