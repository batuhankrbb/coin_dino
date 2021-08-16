import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:hive/hive.dart';

part 'alert_model.g.dart';

@HiveType(typeId: 1)
class AlertModel {
  @HiveField(1)
  final String coindID;

  @HiveField(2)
  final num targetPrice;

  @HiveField(3)
  final bool alertForBigNumber;

  AlertModel({
    required this.coindID,
    required this.targetPrice,
    required this.alertForBigNumber
  });

  factory AlertModel.fromEntity(AlertEntity entity) {
    return AlertModel(
      coindID: entity.coindID,
      targetPrice: entity.targetPrice ?? 0,
      alertForBigNumber: (entity.targetPrice ?? 0) > entity.currentPrice
    );
  }
}
