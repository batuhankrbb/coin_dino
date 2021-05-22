import 'package:coin_dino/core/network/network_fetching/base_network_model.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'alert_model.g.dart';

@HiveType(typeId: 1)
class AlertModel {
  @HiveField(1)
  final String coindID;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final double targetPrice;
  @HiveField(5)
  final double price;

  AlertModel(
      {required this.coindID,
      required this.name,
      required this.image,
      required this.targetPrice,
      required this.price});

  AlertEntity toEntity() {
    return AlertEntity(
        coindID: coindID,
        name: name,
        image: image,
        targetPrice: targetPrice,
        price: price);
  }

  factory AlertModel.fromEntity(AlertEntity entity) {
    return AlertModel(
        coindID: entity.coindID,
        name: entity.name,
        image: entity.image,
        targetPrice: entity.targetPrice,
        price: entity.price);
  }
}
