import '../../../../core/mini_services/date/date_helper.dart';
import '../../../../core/parsing/html_parser.dart';

import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entity/coin_detail_entity.dart';

class CoinDetailModel extends BaseNetworkModel {
  CoinDetailModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.description,
    required this.links,
    required this.image,
    required this.marketCapRank,
    required this.marketData,
    required this.lastUpdated,
  });

  final String id;
  final String symbol;
  final String name;
  final Description description;
  final Links links;
  final Image image;

  final num? marketCapRank;

  final MarketData marketData;
  final DateTime? lastUpdated;

  Map<String, dynamic> toJson() => {};

  @override
  fromJson(Map<String, dynamic> json) {
    return CoinDetailModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      description: Description.fromJson(json["description"]),
      links: Links.fromJson(json["links"]),
      image: Image.fromJson(json["image"]),
      marketCapRank: json["market_cap_rank"],
      marketData: MarketData.fromJson(json["market_data"]),
      lastUpdated: DateTime.parse(json["last_updated"]),
    );
  }

  @override
  CoinDetailEntity toEntity() {
    var parsedDescription = HtmlParser.shared.parseHtmlToString(description.en);
    return CoinDetailEntity(
        id: id,
        symbol: symbol,
        name: name,
        price: marketData.currentPrice?.usd ?? 0,
        priceChange14dTable: marketData.priceChangePercentage14D ?? 0,
        priceChange1yTable: marketData.priceChangePercentage1Y ?? 0,
        priceChange24hTable: marketData.priceChangePercentage24H ?? 0,
        priceChange30dTable: marketData.priceChangePercentage30D ?? 0,
        priceChange60dTable: marketData.priceChangePercentage60D ?? 0,
        priceChange7dTable: marketData.priceChangePercentage7D ?? 0,
        availableSuppy: marketData.circulatingSupply.toString(),
        totalSupply: marketData.totalSupply.toString(),
        priceChange24h: marketData.priceChange24H ?? 0,
        marketCap: marketData.marketCap?.usd != null
            ? "\$${marketData.marketCap!.usd.toString()}"
            : "-",
        marketCapRank: marketData.marketCapRank != null
            ? marketData.marketCapRank.toString()
            : "-",
        tradingVolume: marketData.totalVolume?.usd != null
            ? "\$${marketData.totalVolume!.usd.toString()}"
            : "-",
        highest24h: marketData.high24H?.usd != null
            ? "\$${marketData.high24H!.usd.toString()}"
            : "-",
        lowest24h: marketData.low24H?.usd != null
            ? "\$${marketData.low24H!.usd.toString()}"
            : "-",
        allTimeHigh: marketData.ath?.usd != null
            ? "\$${marketData.ath!.usd.toString()}"
            : "-",
        sinceAllTimeHigh: marketData.athChangePercentage?.usd != null
            ? "${marketData.athChangePercentage!.usd.toString()}%"
            : "-",
        allTimeHighDate:
            DateHelper.shared.formatDate(dateTime: marketData.athDate!.usd),
        allTimeLowDate:
            DateHelper.shared.formatDate(dateTime: marketData.atlDate!.usd),
        allTimeLow:
            marketData.atl?.usd != null ? marketData.atl!.usd.toString() : "-",
        sinceAllTimeLow: marketData.atlChangePercentage?.usd != null
            ? "${marketData.atlChangePercentage?.usd.toString()}%"
            : "-",
        homePageUrl: links.homepage.first,
        imageUrl: image.large,
        description: parsedDescription);
  }
}

class Description {
  Description({
    required this.en,
  });

  final String en;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class Image {
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  final String thumb;
  final String small;
  final String large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
      };
}

class Links {
  Links({
    required this.homepage,
  });

  final List<String> homepage;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "homepage": List<dynamic>.from(homepage.map((x) => x)),
      };
}

class MarketData {
  MarketData({
    required this.currentPrice,
    required this.totalValueLocked,
    required this.mcapToTvlRatio,
    required this.fdvToTvlRatio,
    required this.roi,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.priceChangePercentage7D,
    required this.priceChangePercentage14D,
    required this.priceChangePercentage30D,
    required this.priceChangePercentage60D,
    required this.priceChangePercentage200D,
    required this.priceChangePercentage1Y,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.priceChange24HInCurrency,
    required this.priceChangePercentage1HInCurrency,
    required this.priceChangePercentage24HInCurrency,
    required this.priceChangePercentage7DInCurrency,
    required this.priceChangePercentage14DInCurrency,
    required this.priceChangePercentage30DInCurrency,
    required this.priceChangePercentage60DInCurrency,
    required this.priceChangePercentage200DInCurrency,
    required this.priceChangePercentage1YInCurrency,
    required this.marketCapChange24HInCurrency,
    required this.marketCapChangePercentage24HInCurrency,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.lastUpdated,
  });

  final Ath? currentPrice;
  final dynamic? totalValueLocked;
  final dynamic? mcapToTvlRatio;
  final dynamic? fdvToTvlRatio;
  final dynamic? roi;
  final Ath? ath;
  final Ath? athChangePercentage;
  final Date? athDate;
  final Ath? atl;
  final Ath? atlChangePercentage;
  final Date? atlDate;
  final Ath? marketCap;
  final num? marketCapRank;
  final Ath? fullyDilutedValuation;
  final Ath? totalVolume;
  final Ath? high24H;
  final Ath? low24H;
  final num? priceChange24H;
  final num? priceChangePercentage24H;
  final num? priceChangePercentage7D;
  final num? priceChangePercentage14D;
  final num? priceChangePercentage30D;
  final num? priceChangePercentage60D;
  final num? priceChangePercentage200D;
  final num? priceChangePercentage1Y;
  final num? marketCapChange24H;
  final num? marketCapChangePercentage24H;
  final Ath? priceChange24HInCurrency;
  final Ath? priceChangePercentage1HInCurrency;
  final Ath? priceChangePercentage24HInCurrency;
  final Ath? priceChangePercentage7DInCurrency;
  final Ath? priceChangePercentage14DInCurrency;
  final Ath? priceChangePercentage30DInCurrency;
  final Ath? priceChangePercentage60DInCurrency;
  final Ath? priceChangePercentage200DInCurrency;
  final Ath? priceChangePercentage1YInCurrency;
  final Ath? marketCapChange24HInCurrency;
  final Ath? marketCapChangePercentage24HInCurrency;
  final num? totalSupply;
  final num? maxSupply;
  final num? circulatingSupply;
  final DateTime lastUpdated;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Ath.fromJson(json["current_price"]),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Ath.fromJson(json["ath"]),
        athChangePercentage: Ath.fromJson(json["ath_change_percentage"]),
        athDate: Date.fromJson(json["ath_date"]),
        atl: Ath.fromJson(json["atl"]),
        atlChangePercentage: Ath.fromJson(json["atl_change_percentage"]),
        atlDate: Date.fromJson(json["atl_date"]),
        marketCap: Ath.fromJson(json["market_cap"]),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: Ath.fromJson(json["fully_diluted_valuation"]),
        totalVolume: Ath.fromJson(json["total_volume"]),
        high24H: Ath.fromJson(json["high_24h"]),
        low24H: Ath.fromJson(json["low_24h"]),
        priceChange24H: json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"],
        priceChangePercentage7D: json["price_change_percentage_7d"],
        priceChangePercentage14D: json["price_change_percentage_14d"],
        priceChangePercentage30D: json["price_change_percentage_30d"],
        priceChangePercentage60D: json["price_change_percentage_60d"],
        priceChangePercentage200D: json["price_change_percentage_200d"],
        priceChangePercentage1Y: json["price_change_percentage_1y"],
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
        priceChange24HInCurrency:
            Ath.fromJson(json["price_change_24h_in_currency"]),
        priceChangePercentage1HInCurrency:
            Ath.fromJson(json["price_change_percentage_1h_in_currency"]),
        priceChangePercentage24HInCurrency:
            Ath.fromJson(json["price_change_percentage_24h_in_currency"]),
        priceChangePercentage7DInCurrency:
            Ath.fromJson(json["price_change_percentage_7d_in_currency"]),
        priceChangePercentage14DInCurrency:
            Ath.fromJson(json["price_change_percentage_14d_in_currency"]),
        priceChangePercentage30DInCurrency:
            Ath.fromJson(json["price_change_percentage_30d_in_currency"]),
        priceChangePercentage60DInCurrency:
            Ath.fromJson(json["price_change_percentage_60d_in_currency"]),
        priceChangePercentage200DInCurrency:
            Ath.fromJson(json["price_change_percentage_200d_in_currency"]),
        priceChangePercentage1YInCurrency:
            Ath.fromJson(json["price_change_percentage_1y_in_currency"]),
        marketCapChange24HInCurrency:
            Ath.fromJson(json["market_cap_change_24h_in_currency"]),
        marketCapChangePercentage24HInCurrency:
            Ath.fromJson(json["market_cap_change_percentage_24h_in_currency"]),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );
}

class Ath {
  Ath({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.athTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  final num? aed;
  final num? ars;
  final num? aud;
  final num? bch;
  final num? bdt;
  final num? bhd;
  final num? bmd;
  final num? bnb;
  final num? brl;
  final num? btc;
  final num? cad;
  final num? chf;
  final num? clp;
  final num? cny;
  final num? czk;
  final num? dkk;
  final num? dot;
  final num? eos;
  final num? eth;
  final num? eur;
  final num? gbp;
  final num? hkd;
  final num? huf;
  final num? idr;
  final num? ils;
  final num? inr;
  final num? jpy;
  final num? krw;
  final num? kwd;
  final num? lkr;
  final num? ltc;
  final num? mmk;
  final num? mxn;
  final num? myr;
  final num? ngn;
  final num? nok;
  final num? nzd;
  final num? php;
  final num? pkr;
  final num? pln;
  final num? rub;
  final num? sar;
  final num? sek;
  final num? sgd;
  final num? thb;
  final num? athTry;
  final num? twd;
  final num? uah;
  final num? usd;
  final num? vef;
  final num? vnd;
  final num? xag;
  final num? xau;
  final num? xdr;
  final num? xlm;
  final num? xrp;
  final num? yfi;
  final num? zar;
  final num? bits;
  final num? link;
  final num? sats;

  factory Ath.fromJson(Map<String, dynamic> json) => Ath(
        aed: json["aed"],
        ars: json["ars"],
        aud: json["aud"],
        bch: json["bch"],
        bdt: json["bdt"],
        bhd: json["bhd"],
        bmd: json["bmd"],
        bnb: json["bnb"],
        brl: json["brl"],
        btc: json["btc"],
        cad: json["cad"],
        chf: json["chf"],
        clp: json["clp"],
        cny: json["cny"],
        czk: json["czk"],
        dkk: json["dkk"],
        dot: json["dot"],
        eos: json["eos"],
        eth: json["eth"],
        eur: json["eur"],
        gbp: json["gbp"],
        hkd: json["hkd"],
        huf: json["huf"],
        idr: json["idr"],
        ils: json["ils"],
        inr: json["inr"],
        jpy: json["jpy"],
        krw: json["krw"],
        kwd: json["kwd"],
        lkr: json["lkr"],
        ltc: json["ltc"],
        mmk: json["mmk"],
        mxn: json["mxn"],
        myr: json["myr"],
        ngn: json["ngn"],
        nok: json["nok"],
        nzd: json["nzd"],
        php: json["php"],
        pkr: json["pkr"],
        pln: json["pln"],
        rub: json["rub"],
        sar: json["sar"],
        sek: json["sek"],
        sgd: json["sgd"],
        thb: json["thb"],
        athTry: json["try"],
        twd: json["twd"],
        uah: json["uah"],
        usd: json["usd"],
        vef: json["vef"],
        vnd: json["vnd"],
        xag: json["xag"],
        xau: json["xau"],
        xdr: json["xdr"],
        xlm: json["xlm"],
        xrp: json["xrp"],
        yfi: json["yfi"],
        zar: json["zar"],
        bits: json["bits"],
        link: json["link"],
        sats: json["sats"],
      );

  Map<String, dynamic> toJson() => {
        "aed": aed,
        "ars": ars,
        "aud": aud,
        "bch": bch,
        "bdt": bdt,
        "bhd": bhd,
        "bmd": bmd,
        "bnb": bnb,
        "brl": brl,
        "btc": btc,
        "cad": cad,
        "chf": chf,
        "clp": clp,
        "cny": cny,
        "czk": czk,
        "dkk": dkk,
        "dot": dot,
        "eos": eos,
        "eth": eth,
        "eur": eur,
        "gbp": gbp,
        "hkd": hkd,
        "huf": huf,
        "idr": idr,
        "ils": ils,
        "inr": inr,
        "jpy": jpy,
        "krw": krw,
        "kwd": kwd,
        "lkr": lkr,
        "ltc": ltc,
        "mmk": mmk,
        "mxn": mxn,
        "myr": myr,
        "ngn": ngn,
        "nok": nok,
        "nzd": nzd,
        "php": php,
        "pkr": pkr,
        "pln": pln,
        "rub": rub,
        "sar": sar,
        "sek": sek,
        "sgd": sgd,
        "thb": thb,
        "try": athTry,
        "twd": twd,
        "uah": uah,
        "usd": usd,
        "vef": vef,
        "vnd": vnd,
        "xag": xag,
        "xau": xau,
        "xdr": xdr,
        "xlm": xlm,
        "xrp": xrp,
        "yfi": yfi,
        "zar": zar,
        "bits": bits,
        "link": link,
        "sats": sats,
      };
}

class Date {
  Date({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.dateTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  final DateTime aed;
  final DateTime ars;
  final DateTime aud;
  final DateTime bch;
  final DateTime bdt;
  final DateTime bhd;
  final DateTime bmd;
  final DateTime bnb;
  final DateTime brl;
  final DateTime btc;
  final DateTime cad;
  final DateTime chf;
  final DateTime clp;
  final DateTime cny;
  final DateTime czk;
  final DateTime dkk;
  final DateTime dot;
  final DateTime eos;
  final DateTime eth;
  final DateTime eur;
  final DateTime gbp;
  final DateTime hkd;
  final DateTime huf;
  final DateTime idr;
  final DateTime ils;
  final DateTime inr;
  final DateTime jpy;
  final DateTime krw;
  final DateTime kwd;
  final DateTime lkr;
  final DateTime ltc;
  final DateTime mmk;
  final DateTime mxn;
  final DateTime myr;
  final DateTime ngn;
  final DateTime nok;
  final DateTime nzd;
  final DateTime php;
  final DateTime pkr;
  final DateTime pln;
  final DateTime rub;
  final DateTime sar;
  final DateTime sek;
  final DateTime sgd;
  final DateTime thb;
  final DateTime dateTry;
  final DateTime twd;
  final DateTime uah;
  final DateTime usd;
  final DateTime vef;
  final DateTime vnd;
  final DateTime xag;
  final DateTime xau;
  final DateTime xdr;
  final DateTime xlm;
  final DateTime xrp;
  final DateTime yfi;
  final DateTime zar;
  final DateTime bits;
  final DateTime link;
  final DateTime sats;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        aed: DateTime.parse(json["aed"]),
        ars: DateTime.parse(json["ars"]),
        aud: DateTime.parse(json["aud"]),
        bch: DateTime.parse(json["bch"]),
        bdt: DateTime.parse(json["bdt"]),
        bhd: DateTime.parse(json["bhd"]),
        bmd: DateTime.parse(json["bmd"]),
        bnb: DateTime.parse(json["bnb"]),
        brl: DateTime.parse(json["brl"]),
        btc: DateTime.parse(json["btc"]),
        cad: DateTime.parse(json["cad"]),
        chf: DateTime.parse(json["chf"]),
        clp: DateTime.parse(json["clp"]),
        cny: DateTime.parse(json["cny"]),
        czk: DateTime.parse(json["czk"]),
        dkk: DateTime.parse(json["dkk"]),
        dot: DateTime.parse(json["dot"]),
        eos: DateTime.parse(json["eos"]),
        eth: DateTime.parse(json["eth"]),
        eur: DateTime.parse(json["eur"]),
        gbp: DateTime.parse(json["gbp"]),
        hkd: DateTime.parse(json["hkd"]),
        huf: DateTime.parse(json["huf"]),
        idr: DateTime.parse(json["idr"]),
        ils: DateTime.parse(json["ils"]),
        inr: DateTime.parse(json["inr"]),
        jpy: DateTime.parse(json["jpy"]),
        krw: DateTime.parse(json["krw"]),
        kwd: DateTime.parse(json["kwd"]),
        lkr: DateTime.parse(json["lkr"]),
        ltc: DateTime.parse(json["ltc"]),
        mmk: DateTime.parse(json["mmk"]),
        mxn: DateTime.parse(json["mxn"]),
        myr: DateTime.parse(json["myr"]),
        ngn: DateTime.parse(json["ngn"]),
        nok: DateTime.parse(json["nok"]),
        nzd: DateTime.parse(json["nzd"]),
        php: DateTime.parse(json["php"]),
        pkr: DateTime.parse(json["pkr"]),
        pln: DateTime.parse(json["pln"]),
        rub: DateTime.parse(json["rub"]),
        sar: DateTime.parse(json["sar"]),
        sek: DateTime.parse(json["sek"]),
        sgd: DateTime.parse(json["sgd"]),
        thb: DateTime.parse(json["thb"]),
        dateTry: DateTime.parse(json["try"]),
        twd: DateTime.parse(json["twd"]),
        uah: DateTime.parse(json["uah"]),
        usd: DateTime.parse(json["usd"]),
        vef: DateTime.parse(json["vef"]),
        vnd: DateTime.parse(json["vnd"]),
        xag: DateTime.parse(json["xag"]),
        xau: DateTime.parse(json["xau"]),
        xdr: DateTime.parse(json["xdr"]),
        xlm: DateTime.parse(json["xlm"]),
        xrp: DateTime.parse(json["xrp"]),
        yfi: DateTime.parse(json["yfi"]),
        zar: DateTime.parse(json["zar"]),
        bits: DateTime.parse(json["bits"]),
        link: DateTime.parse(json["link"]),
        sats: DateTime.parse(json["sats"]),
      );

  Map<String, dynamic> toJson() => {
        "aed": aed.toIso8601String(),
        "ars": ars.toIso8601String(),
        "aud": aud.toIso8601String(),
        "bch": bch.toIso8601String(),
        "bdt": bdt.toIso8601String(),
        "bhd": bhd.toIso8601String(),
        "bmd": bmd.toIso8601String(),
        "bnb": bnb.toIso8601String(),
        "brl": brl.toIso8601String(),
        "btc": btc.toIso8601String(),
        "cad": cad.toIso8601String(),
        "chf": chf.toIso8601String(),
        "clp": clp.toIso8601String(),
        "cny": cny.toIso8601String(),
        "czk": czk.toIso8601String(),
        "dkk": dkk.toIso8601String(),
        "dot": dot.toIso8601String(),
        "eos": eos.toIso8601String(),
        "eth": eth.toIso8601String(),
        "eur": eur.toIso8601String(),
        "gbp": gbp.toIso8601String(),
        "hkd": hkd.toIso8601String(),
        "huf": huf.toIso8601String(),
        "idr": idr.toIso8601String(),
        "ils": ils.toIso8601String(),
        "inr": inr.toIso8601String(),
        "jpy": jpy.toIso8601String(),
        "krw": krw.toIso8601String(),
        "kwd": kwd.toIso8601String(),
        "lkr": lkr.toIso8601String(),
        "ltc": ltc.toIso8601String(),
        "mmk": mmk.toIso8601String(),
        "mxn": mxn.toIso8601String(),
        "myr": myr.toIso8601String(),
        "ngn": ngn.toIso8601String(),
        "nok": nok.toIso8601String(),
        "nzd": nzd.toIso8601String(),
        "php": php.toIso8601String(),
        "pkr": pkr.toIso8601String(),
        "pln": pln.toIso8601String(),
        "rub": rub.toIso8601String(),
        "sar": sar.toIso8601String(),
        "sek": sek.toIso8601String(),
        "sgd": sgd.toIso8601String(),
        "thb": thb.toIso8601String(),
        "try": dateTry.toIso8601String(),
        "twd": twd.toIso8601String(),
        "uah": uah.toIso8601String(),
        "usd": usd.toIso8601String(),
        "vef": vef.toIso8601String(),
        "vnd": vnd.toIso8601String(),
        "xag": xag.toIso8601String(),
        "xau": xau.toIso8601String(),
        "xdr": xdr.toIso8601String(),
        "xlm": xlm.toIso8601String(),
        "xrp": xrp.toIso8601String(),
        "yfi": yfi.toIso8601String(),
        "zar": zar.toIso8601String(),
        "bits": bits.toIso8601String(),
        "link": link.toIso8601String(),
        "sats": sats.toIso8601String(),
      };
}

class Market {
  Market({
    required this.name,
    required this.identifier,
    required this.hasTradingIncentive,
  });

  final String name;
  final String identifier;
  final bool hasTradingIncentive;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json["name"],
        identifier: json["identifier"],
        hasTradingIncentive: json["has_trading_incentive"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "identifier": identifier,
        "has_trading_incentive": hasTradingIncentive,
      };
}
