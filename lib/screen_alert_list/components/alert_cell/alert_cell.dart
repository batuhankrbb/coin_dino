import 'package:auto_size_text/auto_size_text.dart';
import '../../../core/utils/number_helper.dart';
import '../../../features/alert/domain/entity/alert_entity.dart';
import '../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../global/components/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'alert_cell_prices_text.dart';


class AlertCell extends StatelessWidget {
  const AlertCell(
      {Key? key,
      required this.alertEntity,
      required this.onTap,
      required this.onDismiss})
      : super(key: key);

  final AlertEntity alertEntity;
  final VoidCallback onTap;
  final Function(int index) onDismiss;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: buildDismissibleBackground(context),
      key: Key(alertEntity.coindID),
      child: ListTile(
        onTap: onTap,
        leading: buildLeading(),
        title: buildTitle(context),
        subtitle: buildSubtitle(context),
        trailing: AlertCellPricesWidget(alertEntity: alertEntity),
      ),
      onDismissed: (direction) {
        onDismiss(direction.index);
      },
    );
  }

  Container buildDismissibleBackground(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: context.getWidth(0.03)),
      alignment: Alignment.centerRight,
      color: context.colorScheme.onPrimary,
      child: AutoSizeText(
        "ALERT_LIST_SCREEN_ALERT_CELL_REMOVE_TEXT".tr(),
        style: TextStyle(
            color: context.colorScheme.onSurface,
            fontSize: context.getWidth(0.045),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  InformerWidget buildLeading() {
    return InformerWidget(
      onPageBuild: (context, screenInfo) {
        return CachedNetworkImageWidget(
          imageURL: alertEntity.image,
          imageHeigth: screenInfo.boundsSize.height * 0.8,
          imageWidth: screenInfo.boundsSize.height * 0.8,
        );
      },
    );
  }

  AutoSizeText buildSubtitle(BuildContext context) {
    return AutoSizeText(
      alertEntity.symbol.toUpperCase(),
      maxLines: 1,
      style: TextStyle(fontSize: context.getWidth(0.035)),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      alertEntity.name,
      maxLines: 1,
      style: TextStyle(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.w500,
        fontSize: context.getWidth(0.045),
      ),
    );
  }
}

