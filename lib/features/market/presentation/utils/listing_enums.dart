
enum MarketDate { hour1, hour24, day1, day7, day30 }

extension rawExtensionMarketDate on MarketDate {
  String get rawValue {
    switch (this) {
      case MarketDate.hour1:
        return "1h";
      case MarketDate.hour24:
        return "24h";
      case MarketDate.day1:
         return "1d";
      case MarketDate.day7:
        return "7d";
      case MarketDate.day30:
        return "30d";
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
}
