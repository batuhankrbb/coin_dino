/// Coin Detail Page Model



class CoinsDetailModel {
  CoinsDetailModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.assetPlatformId,
    required this.platforms,
    required this.blockTimeInMinutes,
    required this.hashingAlgorithm,
    required this.categories,
    required this.publicNotice,
    required this.additionalNotices,
    required this.description,
    required this.links,
    required this.image,
    required this.countryOrigin,
    required this.genesisDate,
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.marketCapRank,
    required this.coingeckoRank,
    required this.coingeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.marketData,
    required this.communityData,
    required this.developerData,
    required this.publicInterestStats,
    required this.statusUpdates,
    required this.lastUpdated,
    required this.tickers,
  });

  final String id;
  final String symbol;
  final String name;
  final dynamic assetPlatformId;
  final Platforms platforms;
  final int blockTimeInMinutes;
  final String hashingAlgorithm;
  final List<String> categories;
  final dynamic publicNotice;
  final List<dynamic> additionalNotices;
  final Description description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final DateTime genesisDate;
  final int sentimentVotesUpPercentage;
  final int sentimentVotesDownPercentage;
  final int marketCapRank;
  final int coingeckoRank;
  final double coingeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final int publicInterestScore;
  final MarketData marketData;
  final CommunityData communityData;
  final DeveloperData developerData;
  final PublicInterestStats publicInterestStats;
  final List<dynamic> statusUpdates;
  final DateTime lastUpdated;
  final List<Ticker> tickers;

  factory CoinsDetailModel.fromJson(Map<String, dynamic> json) =>
      CoinsDetailModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        platforms: Platforms.fromJson(json["platforms"]),
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices:
            List<dynamic>.from(json["additional_notices"].map((x) => x)),
        description: Description.fromJson(json["description"]),
        links: Links.fromJson(json["links"]),
        image: Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage: json["sentiment_votes_up_percentage"],
        sentimentVotesDownPercentage: json["sentiment_votes_down_percentage"],
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"].toDouble(),
        developerScore: json["developer_score"].toDouble(),
        communityScore: json["community_score"].toDouble(),
        liquidityScore: json["liquidity_score"].toDouble(),
        publicInterestScore: json["public_interest_score"],
        marketData: MarketData.fromJson(json["market_data"]),
        communityData: CommunityData.fromJson(json["community_data"]),
        developerData: DeveloperData.fromJson(json["developer_data"]),
        publicInterestStats:
            PublicInterestStats.fromJson(json["public_interest_stats"]),
        statusUpdates: List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
        tickers:
            List<Ticker>.from(json["tickers"].map((x) => Ticker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "platforms": platforms.toJson(),
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices":
            List<dynamic>.from(additionalNotices.map((x) => x)),
        "description": description.toJson(),
        "links": links.toJson(),
        "image": image.toJson(),
        "country_origin": countryOrigin,
        "genesis_date":
            "${genesisDate.year.toString().padLeft(4, '0')}-${genesisDate.month.toString().padLeft(2, '0')}-${genesisDate.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "market_data": marketData.toJson(),
        "community_data": communityData.toJson(),
        "developer_data": developerData.toJson(),
        "public_interest_stats": publicInterestStats.toJson(),
        "status_updates": List<dynamic>.from(statusUpdates.map((x) => x)),
        "last_updated": lastUpdated.toIso8601String(),
        "tickers": List<dynamic>.from(tickers.map((x) => x.toJson())),
      };
}

class CommunityData {
  CommunityData({
    required this.facebookLikes,
    required this.twitterFollowers,
    required this.redditAveragePosts48H,
    required this.redditAverageComments48H,
    required this.redditSubscribers,
    required this.redditAccountsActive48H,
    required this.telegramChannelUserCount,
  });

  final dynamic facebookLikes;
  final int twitterFollowers;
  final int redditAveragePosts48H;
  final double redditAverageComments48H;
  final int redditSubscribers;
  final int redditAccountsActive48H;
  final dynamic telegramChannelUserCount;

  factory CommunityData.fromJson(Map<String, dynamic> json) => CommunityData(
        facebookLikes: json["facebook_likes"],
        twitterFollowers: json["twitter_followers"],
        redditAveragePosts48H: json["reddit_average_posts_48h"],
        redditAverageComments48H:
            json["reddit_average_comments_48h"].toDouble(),
        redditSubscribers: json["reddit_subscribers"],
        redditAccountsActive48H: json["reddit_accounts_active_48h"],
        telegramChannelUserCount: json["telegram_channel_user_count"],
      );

  Map<String, dynamic> toJson() => {
        "facebook_likes": facebookLikes,
        "twitter_followers": twitterFollowers,
        "reddit_average_posts_48h": redditAveragePosts48H,
        "reddit_average_comments_48h": redditAverageComments48H,
        "reddit_subscribers": redditSubscribers,
        "reddit_accounts_active_48h": redditAccountsActive48H,
        "telegram_channel_user_count": telegramChannelUserCount,
      };
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

class DeveloperData {
  DeveloperData({
    required this.forks,
    required this.stars,
    required this.subscribers,
    required this.totalIssues,
    required this.closedIssues,
    required this.pullRequestsMerged,
    required this.pullRequestContributors,
    required this.codeAdditionsDeletions4Weeks,
    required this.commitCount4Weeks,
    required this.last4WeeksCommitActivitySeries,
  });

  final int forks;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestsMerged;
  final int pullRequestContributors;
  final CodeAdditionsDeletions4Weeks codeAdditionsDeletions4Weeks;
  final int commitCount4Weeks;
  final List<int> last4WeeksCommitActivitySeries;

  factory DeveloperData.fromJson(Map<String, dynamic> json) => DeveloperData(
        forks: json["forks"],
        stars: json["stars"],
        subscribers: json["subscribers"],
        totalIssues: json["total_issues"],
        closedIssues: json["closed_issues"],
        pullRequestsMerged: json["pull_requests_merged"],
        pullRequestContributors: json["pull_request_contributors"],
        codeAdditionsDeletions4Weeks: CodeAdditionsDeletions4Weeks.fromJson(
            json["code_additions_deletions_4_weeks"]),
        commitCount4Weeks: json["commit_count_4_weeks"],
        last4WeeksCommitActivitySeries: List<int>.from(
            json["last_4_weeks_commit_activity_series"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "forks": forks,
        "stars": stars,
        "subscribers": subscribers,
        "total_issues": totalIssues,
        "closed_issues": closedIssues,
        "pull_requests_merged": pullRequestsMerged,
        "pull_request_contributors": pullRequestContributors,
        "code_additions_deletions_4_weeks":
            codeAdditionsDeletions4Weeks.toJson(),
        "commit_count_4_weeks": commitCount4Weeks,
        "last_4_weeks_commit_activity_series":
            List<dynamic>.from(last4WeeksCommitActivitySeries.map((x) => x)),
      };
}

class CodeAdditionsDeletions4Weeks {
  CodeAdditionsDeletions4Weeks({
    required this.additions,
    required this.deletions,
  });

  final int additions;
  final int deletions;

  factory CodeAdditionsDeletions4Weeks.fromJson(Map<String, dynamic> json) =>
      CodeAdditionsDeletions4Weeks(
        additions: json["additions"],
        deletions: json["deletions"],
      );

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "deletions": deletions,
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
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.bitcointalkThreadIdentifier,
    required this.telegramChannelIdentifier,
    required this.subredditUrl,
    required this.reposUrl,
  });

  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final String twitterScreenName;
  final String facebookUsername;
  final dynamic bitcointalkThreadIdentifier;
  final String telegramChannelIdentifier;
  final String subredditUrl;
  final ReposUrl reposUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
        blockchainSite:
            List<String>.from(json["blockchain_site"].map((x) => x)),
        officialForumUrl:
            List<String>.from(json["official_forum_url"].map((x) => x)),
        chatUrl: List<String>.from(json["chat_url"].map((x) => x)),
        announcementUrl:
            List<String>.from(json["announcement_url"].map((x) => x)),
        twitterScreenName: json["twitter_screen_name"],
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
        reposUrl: ReposUrl.fromJson(json["repos_url"]),
      );

  Map<String, dynamic> toJson() => {
        "homepage": List<dynamic>.from(homepage.map((x) => x)),
        "blockchain_site": List<dynamic>.from(blockchainSite.map((x) => x)),
        "official_forum_url":
            List<dynamic>.from(officialForumUrl.map((x) => x)),
        "chat_url": List<dynamic>.from(chatUrl.map((x) => x)),
        "announcement_url": List<dynamic>.from(announcementUrl.map((x) => x)),
        "twitter_screen_name": twitterScreenName,
        "facebook_username": facebookUsername,
        "bitcointalk_thread_identifier": bitcointalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
        "repos_url": reposUrl.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    required this.github,
    required this.bitbucket,
  });

  final List<String> github;
  final List<dynamic> bitbucket;

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: List<String>.from(json["github"].map((x) => x)),
        bitbucket: List<dynamic>.from(json["bitbucket"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "github": List<dynamic>.from(github.map((x) => x)),
        "bitbucket": List<dynamic>.from(bitbucket.map((x) => x)),
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

  final Ath currentPrice;
  final dynamic totalValueLocked;
  final dynamic mcapToTvlRatio;
  final dynamic fdvToTvlRatio;
  final dynamic roi;
  final Ath ath;
  final Ath athChangePercentage;
  final Date athDate;
  final Ath atl;
  final Ath atlChangePercentage;
  final Date atlDate;
  final Ath marketCap;
  final int marketCapRank;
  final Ath fullyDilutedValuation;
  final Ath totalVolume;
  final Ath high24H;
  final Ath low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double priceChangePercentage7D;
  final double priceChangePercentage14D;
  final double priceChangePercentage30D;
  final double priceChangePercentage60D;
  final double priceChangePercentage200D;
  final double priceChangePercentage1Y;
  final double marketCapChange24H;
  final double marketCapChangePercentage24H;
  final Ath priceChange24HInCurrency;
  final Ath priceChangePercentage1HInCurrency;
  final Ath priceChangePercentage24HInCurrency;
  final Ath priceChangePercentage7DInCurrency;
  final Ath priceChangePercentage14DInCurrency;
  final Ath priceChangePercentage30DInCurrency;
  final Ath priceChangePercentage60DInCurrency;
  final Ath priceChangePercentage200DInCurrency;
  final Ath priceChangePercentage1YInCurrency;
  final Ath marketCapChange24HInCurrency;
  final Ath marketCapChangePercentage24HInCurrency;
  final int totalSupply;
  final int maxSupply;
  final int circulatingSupply;
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
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"].toDouble(),
        priceChangePercentage14D:
            json["price_change_percentage_14d"].toDouble(),
        priceChangePercentage30D:
            json["price_change_percentage_30d"].toDouble(),
        priceChangePercentage60D:
            json["price_change_percentage_60d"].toDouble(),
        priceChangePercentage200D:
            json["price_change_percentage_200d"].toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
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

  Map<String, dynamic> toJson() => {
        "current_price": currentPrice.toJson(),
        "total_value_locked": totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio,
        "roi": roi,
        "ath": ath.toJson(),
        "ath_change_percentage": athChangePercentage.toJson(),
        "ath_date": athDate.toJson(),
        "atl": atl.toJson(),
        "atl_change_percentage": atlChangePercentage.toJson(),
        "atl_date": atlDate.toJson(),
        "market_cap": marketCap.toJson(),
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation.toJson(),
        "total_volume": totalVolume.toJson(),
        "high_24h": high24H.toJson(),
        "low_24h": low24H.toJson(),
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "price_change_percentage_7d": priceChangePercentage7D,
        "price_change_percentage_14d": priceChangePercentage14D,
        "price_change_percentage_30d": priceChangePercentage30D,
        "price_change_percentage_60d": priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D,
        "price_change_percentage_1y": priceChangePercentage1Y,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "price_change_24h_in_currency": priceChange24HInCurrency.toJson(),
        "price_change_percentage_1h_in_currency":
            priceChangePercentage1HInCurrency.toJson(),
        "price_change_percentage_24h_in_currency":
            priceChangePercentage24HInCurrency.toJson(),
        "price_change_percentage_7d_in_currency":
            priceChangePercentage7DInCurrency.toJson(),
        "price_change_percentage_14d_in_currency":
            priceChangePercentage14DInCurrency.toJson(),
        "price_change_percentage_30d_in_currency":
            priceChangePercentage30DInCurrency.toJson(),
        "price_change_percentage_60d_in_currency":
            priceChangePercentage60DInCurrency.toJson(),
        "price_change_percentage_200d_in_currency":
            priceChangePercentage200DInCurrency.toJson(),
        "price_change_percentage_1y_in_currency":
            priceChangePercentage1YInCurrency.toJson(),
        "market_cap_change_24h_in_currency":
            marketCapChange24HInCurrency.toJson(),
        "market_cap_change_percentage_24h_in_currency":
            marketCapChangePercentage24HInCurrency.toJson(),
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "last_updated": lastUpdated.toIso8601String(),
      };
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

  final double aed;
  final double ars;
  final double aud;
  final double bch;
  final double bdt;
  final double bhd;
  final double bmd;
  final double bnb;
  final double brl;
  final double btc;
  final double cad;
  final double chf;
  final double clp;
  final double cny;
  final double czk;
  final double dkk;
  final double dot;
  final double eos;
  final double eth;
  final double eur;
  final double gbp;
  final double hkd;
  final double huf;
  final double idr;
  final double ils;
  final double inr;
  final double jpy;
  final double krw;
  final double kwd;
  final double lkr;
  final double ltc;
  final double mmk;
  final double mxn;
  final double myr;
  final double ngn;
  final double nok;
  final double nzd;
  final double php;
  final double pkr;
  final double pln;
  final double rub;
  final double sar;
  final double sek;
  final double sgd;
  final double thb;
  final double athTry;
  final double twd;
  final double uah;
  final double usd;
  final double vef;
  final double vnd;
  final double xag;
  final double xau;
  final double xdr;
  final double xlm;
  final double xrp;
  final double yfi;
  final double zar;
  final double bits;
  final double link;
  final double sats;

  factory Ath.fromJson(Map<String, dynamic> json) => Ath(
        aed: json["aed"].toDouble(),
        ars: json["ars"].toDouble(),
        aud: json["aud"].toDouble(),
        bch: json["bch"].toDouble(),
        bdt: json["bdt"].toDouble(),
        bhd: json["bhd"].toDouble(),
        bmd: json["bmd"].toDouble(),
        bnb: json["bnb"].toDouble(),
        brl: json["brl"].toDouble(),
        btc: json["btc"].toDouble(),
        cad: json["cad"].toDouble(),
        chf: json["chf"].toDouble(),
        clp: json["clp"].toDouble(),
        cny: json["cny"].toDouble(),
        czk: json["czk"].toDouble(),
        dkk: json["dkk"].toDouble(),
        dot: json["dot"] == null ? null : json["dot"].toDouble(),
        eos: json["eos"].toDouble(),
        eth: json["eth"].toDouble(),
        eur: json["eur"].toDouble(),
        gbp: json["gbp"].toDouble(),
        hkd: json["hkd"].toDouble(),
        huf: json["huf"].toDouble(),
        idr: json["idr"].toDouble(),
        ils: json["ils"].toDouble(),
        inr: json["inr"].toDouble(),
        jpy: json["jpy"].toDouble(),
        krw: json["krw"].toDouble(),
        kwd: json["kwd"].toDouble(),
        lkr: json["lkr"].toDouble(),
        ltc: json["ltc"].toDouble(),
        mmk: json["mmk"].toDouble(),
        mxn: json["mxn"].toDouble(),
        myr: json["myr"].toDouble(),
        ngn: json["ngn"].toDouble(),
        nok: json["nok"].toDouble(),
        nzd: json["nzd"].toDouble(),
        php: json["php"].toDouble(),
        pkr: json["pkr"].toDouble(),
        pln: json["pln"].toDouble(),
        rub: json["rub"].toDouble(),
        sar: json["sar"].toDouble(),
        sek: json["sek"].toDouble(),
        sgd: json["sgd"].toDouble(),
        thb: json["thb"].toDouble(),
        athTry: json["try"].toDouble(),
        twd: json["twd"].toDouble(),
        uah: json["uah"].toDouble(),
        usd: json["usd"].toDouble(),
        vef: json["vef"].toDouble(),
        vnd: json["vnd"].toDouble(),
        xag: json["xag"].toDouble(),
        xau: json["xau"].toDouble(),
        xdr: json["xdr"].toDouble(),
        xlm: json["xlm"].toDouble(),
        xrp: json["xrp"].toDouble(),
        yfi: json["yfi"] == null ? null : json["yfi"].toDouble(),
        zar: json["zar"].toDouble(),
        bits: json["bits"].toDouble(),
        link: json["link"].toDouble(),
        sats: json["sats"].toDouble(),
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
        "dot":  dot,
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

class Platforms {
  Platforms({
    required this.empty,
  });

  final String empty;

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "": empty,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    required this.alexaRank,
    required this.bingMatches,
  });

  final int alexaRank;
  final dynamic bingMatches;

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json["alexa_rank"],
        bingMatches: json["bing_matches"],
      );

  Map<String, dynamic> toJson() => {
        "alexa_rank": alexaRank,
        "bing_matches": bingMatches,
      };
}

class Ticker {
  Ticker({
    required this.base,
    required this.target,
    required this.market,
    required this.last,
    required this.volume,
    required this.convertedLast,
    required this.convertedVolume,
    required this.trustScore,
    required this.bidAskSpreadPercentage,
    required this.timestamp,
    required this.lastTradedAt,
    required this.lastFetchAt,
    required this.isAnomaly,
    required this.isStale,
    required this.tradeUrl,
    required this.tokenInfoUrl,
    required this.coinId,
    required this.targetCoinId,
  });

  final String base;
  final String target;
  final Market market;
  final double last;
  final double volume;
  final Converted convertedLast;
  final Converted convertedVolume;
  final String trustScore;
  final double bidAskSpreadPercentage;
  final DateTime timestamp;
  final DateTime lastTradedAt;
  final DateTime lastFetchAt;
  final bool isAnomaly;
  final bool isStale;
  final String tradeUrl;
  final dynamic tokenInfoUrl;
  final String coinId;
  final String targetCoinId;

  factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        base: json["base"],
        target: json["target"],
        market: Market.fromJson(json["market"]),
        last: json["last"].toDouble(),
        volume: json["volume"].toDouble(),
        convertedLast: Converted.fromJson(json["converted_last"]),
        convertedVolume: Converted.fromJson(json["converted_volume"]),
        trustScore: json["trust_score"],
        bidAskSpreadPercentage: json["bid_ask_spread_percentage"].toDouble(),
        timestamp: DateTime.parse(json["timestamp"]),
        lastTradedAt: DateTime.parse(json["last_traded_at"]),
        lastFetchAt: DateTime.parse(json["last_fetch_at"]),
        isAnomaly: json["is_anomaly"],
        isStale: json["is_stale"],
        tradeUrl: json["trade_url"] == null ? null : json["trade_url"],
        tokenInfoUrl: json["token_info_url"],
        coinId: json["coin_id"],
        targetCoinId:
            json["target_coin_id"] == null ? null : json["target_coin_id"],
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "target": target,
        "market": market.toJson(),
        "last": last,
        "volume": volume,
        "converted_last": convertedLast.toJson(),
        "converted_volume": convertedVolume.toJson(),
        "trust_score": trustScore,
        "bid_ask_spread_percentage": bidAskSpreadPercentage,
        "timestamp": timestamp.toIso8601String(),
        "last_traded_at": lastTradedAt.toIso8601String(),
        "last_fetch_at": lastFetchAt.toIso8601String(),
        "is_anomaly": isAnomaly,
        "is_stale": isStale,
        "trade_url": tradeUrl,
        "token_info_url": tokenInfoUrl,
        "coin_id": coinId,
        "target_coin_id":  targetCoinId,
      };
}

class Converted {
  Converted({
    required this.btc,
    required this.eth,
    required this.usd,
  });

  final double btc;
  final double eth;
  final double usd;

  factory Converted.fromJson(Map<String, dynamic> json) => Converted(
        btc: json["btc"].toDouble(),
        eth: json["eth"].toDouble(),
        usd: json["usd"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "btc": btc,
        "eth": eth,
        "usd": usd,
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
