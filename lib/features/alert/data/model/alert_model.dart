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

  AlertModel(this.coindID, this.name, this.image, this.targetPrice);

  AlertEntity toEntity() {
    return AlertEntity(
        coindID: coindID, name: name, image: image, targetPrice: targetPrice);
  }

  factory AlertModel.fromEntity(AlertEntity entity) {
    return AlertModel(
        entity.coindID, entity.name, entity.image, entity.targetPrice);
  }
}
