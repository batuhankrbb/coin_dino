import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/global/components/cashed_network_image_component.dart';
import 'package:flutter/material.dart';

class AlertCell extends StatelessWidget {
  const AlertCell({Key? key, required this.alertEntity}) : super(key: key);

  final AlertEntity alertEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      leading: InformerWidget(
        onPageBuild: (context, screenInfo) {
          return CashedNetworkImageWidget(
            imageURL: alertEntity.image,
            imageHeigth: screenInfo.boundsSize.height * 0.9,
            imageWidth: screenInfo.boundsSize.height * 0.9,
          );
        },
      ),
      title: AutoSizeText(
        alertEntity.name,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      subtitle: AutoSizeText(
        alertEntity.coindID,
      ),
      trailing: AutoSizeText(
        "\$${alertEntity.price}",
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
