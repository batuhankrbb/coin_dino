import '../../domain/entities/market_coin_category_entity.dart';
import 'package:easy_localization/easy_localization.dart';

enum MarketDate { hour1, hour24, day7, day30 }

extension rawExtensionMarketDate on MarketDate {
  String get rawValue {
    switch (this) {
      case MarketDate.hour1:
        return "1h";
      case MarketDate.hour24:
        return "24h";
      case MarketDate.day7:
        return "7d";
      case MarketDate.day30:
        return "30d";
    }
  }

  String get displayValue {
    switch (this) {
      case MarketDate.hour1:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_DATE_1H_DISPLAY_VALUE".tr();
      case MarketDate.hour24:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_DATE_24H_DISPLAY_VALUE".tr();
      case MarketDate.day7:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_DATE_7D_DISPLAY_VALUE".tr();
      case MarketDate.day30:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_DATE_30D_DISPLAY_VALUE".tr();
    }
  }
}

enum MarketSort {
  market_cap_desc,
  gecko_desc,
  gecko_asc,
  market_cap_asc,
  volume_asc,
  volume_desc,
  id_asc,
  id_desc
}

extension rawExtensionMarketSort on MarketSort {
  String get rawValue {
    switch (this) {
      case MarketSort.gecko_asc:
        return "gecko_asc";
      case MarketSort.gecko_desc:
        return "gecko_desc";
      case MarketSort.id_asc:
        return "id_asc";
      case MarketSort.id_desc:
        return "id_desc";
      case MarketSort.market_cap_asc:
        return "market_cap_asc";
      case MarketSort.market_cap_desc:
        return "market_cap_desc";
      case MarketSort.volume_asc:
        return "volume_asc";
      case MarketSort.volume_desc:
        return "volume_desc";
    }
  }

  String get displayValue {
    switch (this) {
      case MarketSort.gecko_asc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_GECKO_ASC_DISPLAY_VALUE"
            .tr();
      case MarketSort.gecko_desc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_GECKO_DESC_DISPLAY_VALUE"
            .tr();
      case MarketSort.id_asc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_ID_ASC_DISPLAY_VALUE"
            .tr();
      case MarketSort.id_desc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_ID_DESC_DISPLAY_VALUE"
            .tr();
      case MarketSort.market_cap_asc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_MARKETCAP_ASC_DISPLAY_VALUE"
            .tr();
      case MarketSort.market_cap_desc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_MARKETCAP_DESC_DISPLAY_VALUE"
            .tr();
      case MarketSort.volume_asc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_VOLUME_ASC_DISPLAY_VALUE"
            .tr();
      case MarketSort.volume_desc:
        return "MARKET_FEATURE.LISTING_ENUM.MARKET_SORT_VOLUME_DESC_DISPLAY_VALUE"
            .tr();
    }
  }
}
