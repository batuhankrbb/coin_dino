import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';

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
        return "1H";
      case MarketDate.hour24:
        return "24H";
      case MarketDate.day7:
        return "7D";
      case MarketDate.day30:
        return "30D";
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
        return "GECKO ASC";
      case MarketSort.gecko_desc:
        return "GECKO DESC";
      case MarketSort.id_asc:
        return "ID ASC";
      case MarketSort.id_desc:
        return "ID DESC";
      case MarketSort.market_cap_asc:
        return "MARKET CAP ASC";
      case MarketSort.market_cap_desc:
        return "MARKET CAP DESC";
      case MarketSort.volume_asc:
        return "VOLUME ASC";
      case MarketSort.volume_desc:
        return "VOLUME DESC";
    }
  }
}

var categoryList = [
  MarketCoinCategoryEntity(categoryID: 'all', categoryName: 'All'),
  MarketCoinCategoryEntity(
      categoryID: 'recently_added', categoryName: 'Recently Added'),
  MarketCoinCategoryEntity(
      categoryID: 'aave-tokens', categoryName: 'Aave Tokens'),
  MarketCoinCategoryEntity(categoryID: 'analytics', categoryName: 'Analytics'),
  MarketCoinCategoryEntity(
      categoryID: 'artificial-intelligence',
      categoryName: 'Artificial Intelligence'),
  MarketCoinCategoryEntity(
      categoryID: 'asset-backed-tokens', categoryName: 'Asset-backed Tokens'),
  MarketCoinCategoryEntity(
      categoryID: 'asset-manager', categoryName: 'Asset Manager'),
  MarketCoinCategoryEntity(
      categoryID: 'augmented-reality', categoryName: 'Augmented Reality'),
  MarketCoinCategoryEntity(
      categoryID: 'automated-market-maker-amm',
      categoryName: 'Automated Market Maker (AMM)'),
  MarketCoinCategoryEntity(
      categoryID: 'avalanche-ecosystem', categoryName: 'Avalanche Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'axie-infinity', categoryName: 'Axie Infinity'),
  MarketCoinCategoryEntity(categoryID: 'big-data', categoryName: 'Big Data'),
  MarketCoinCategoryEntity(
      categoryID: 'binance-launchpool', categoryName: 'Binance Launchpool'),
  MarketCoinCategoryEntity(
      categoryID: 'binance-smart-chain',
      categoryName: 'Binance Smart Chain Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'business-platform', categoryName: 'Business Platform'),
  MarketCoinCategoryEntity(
      categoryID: 'business-services', categoryName: 'Business Services'),
  MarketCoinCategoryEntity(
      categoryID: 'centralized-exchange-token-cex',
      categoryName: 'Centralized Exchange Token (CEX)'),
  MarketCoinCategoryEntity(categoryID: 'charity', categoryName: 'Charity'),
  MarketCoinCategoryEntity(
      categoryID: 'cny-stablecoin', categoryName: 'CNY Stablecoin'),
  MarketCoinCategoryEntity(
      categoryID: 'collectibles', categoryName: 'Collectibles'),
  MarketCoinCategoryEntity(
      categoryID: 'communication', categoryName: 'Communication'),
  MarketCoinCategoryEntity(
      categoryID: 'compound-tokens', categoryName: 'Compound Tokens'),
  MarketCoinCategoryEntity(
      categoryID: 'cosmos-ecosystem', categoryName: 'Cosmos Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'cryptocurrency', categoryName: 'Cryptocurrency'),
  MarketCoinCategoryEntity(
      categoryID: 'decentralized-exchange',
      categoryName: 'Decentralized Exchange Token (DEX)'),
  MarketCoinCategoryEntity(
      categoryID: 'decentralized-finance-defi',
      categoryName: 'Decentralized Finance (DeFi)'),
  MarketCoinCategoryEntity(
      categoryID: 'defi-index', categoryName: 'DeFi Index'),
  MarketCoinCategoryEntity(
      categoryID: 'decentralized-derivatives', categoryName: 'Derivatives'),
  MarketCoinCategoryEntity(categoryID: 'education', categoryName: 'Education'),
  MarketCoinCategoryEntity(categoryID: 'energy', categoryName: 'Energy'),
  MarketCoinCategoryEntity(
      categoryID: 'entertainment', categoryName: 'Entertainment'),
  MarketCoinCategoryEntity(categoryID: 'etf', categoryName: 'ETF'),
  MarketCoinCategoryEntity(
      categoryID: 'eth-2-0-staking', categoryName: 'Eth 2.0 Staking'),
  MarketCoinCategoryEntity(
      categoryID: 'eur-stablecoin', categoryName: 'EUR Stablecoin'),
  MarketCoinCategoryEntity(
      categoryID: 'exchange-based-tokens',
      categoryName: 'Exchange-based Tokens'),
  MarketCoinCategoryEntity(categoryID: 'fan-token', categoryName: 'Fan Token'),
  MarketCoinCategoryEntity(
      categoryID: 'finance-banking', categoryName: 'Finance / Banking'),
  MarketCoinCategoryEntity(categoryID: 'gambling', categoryName: 'Gambling'),
  MarketCoinCategoryEntity(categoryID: 'gaming', categoryName: 'Gaming'),
  MarketCoinCategoryEntity(
      categoryID: 'gbp-stablecoin', categoryName: 'GBP Stablecoin'),
  MarketCoinCategoryEntity(
      categoryID: 'gig-economy', categoryName: 'Gig Economy'),
  MarketCoinCategoryEntity(
      categoryID: 'governance', categoryName: 'Governance'),
  MarketCoinCategoryEntity(
      categoryID: 'healthcare', categoryName: 'Healthcare'),
  MarketCoinCategoryEntity(
      categoryID: 'heco-chain-ecosystem', categoryName: 'HECO Chain Ecosystem'),
  MarketCoinCategoryEntity(categoryID: 'index-coin', categoryName: 'Index'),
  MarketCoinCategoryEntity(
      categoryID: 'infrastructure', categoryName: 'Infrastructure'),
  MarketCoinCategoryEntity(categoryID: 'insurance', categoryName: 'Insurance'),
  MarketCoinCategoryEntity(
      categoryID: 'internet-of-things-iot',
      categoryName: 'Internet of Things (IOT)'),
  MarketCoinCategoryEntity(
      categoryID: 'investment', categoryName: 'Investment'),
  MarketCoinCategoryEntity(
      categoryID: 'krw-stablecoin', categoryName: 'KRW Stablecoin'),
  MarketCoinCategoryEntity(categoryID: 'launchpad', categoryName: 'Launchpad'),
  MarketCoinCategoryEntity(categoryID: 'layer-1', categoryName: 'Layer 1'),
  MarketCoinCategoryEntity(categoryID: 'legal', categoryName: 'Legal'),
  MarketCoinCategoryEntity(
      categoryID: 'lending-borrowing', categoryName: 'Lending/Borrowing'),
  MarketCoinCategoryEntity(categoryID: 'lp-tokens', categoryName: 'LP Tokens'),
  MarketCoinCategoryEntity(
      categoryID: 'manufacturing', categoryName: 'Manufacturing'),
  MarketCoinCategoryEntity(categoryID: 'marketing', categoryName: 'Marketing'),
  MarketCoinCategoryEntity(
      categoryID: 'masternodes', categoryName: 'Masternodes'),
  MarketCoinCategoryEntity(categoryID: 'media', categoryName: 'Media'),
  MarketCoinCategoryEntity(
      categoryID: 'meme-token', categoryName: 'Meme Tokens'),
  MarketCoinCategoryEntity(categoryID: 'metaverse', categoryName: 'Metaverse'),
  MarketCoinCategoryEntity(
      categoryID: 'mirrored-assets', categoryName: 'Mirrored Assets'),
  MarketCoinCategoryEntity(categoryID: 'music', categoryName: 'Music'),
  MarketCoinCategoryEntity(
      categoryID: 'near-protocol-ecosystem',
      categoryName: 'Near Protocol Ecosystem'),
  MarketCoinCategoryEntity(categoryID: 'nft-index', categoryName: 'NFT Index'),
  MarketCoinCategoryEntity(
      categoryID: 'niftex-shards', categoryName: 'Niftex Shards'),
  MarketCoinCategoryEntity(
      categoryID: 'non-fungible-tokens-nft',
      categoryName: 'Non-Fungible Tokens (NFT)'),
  MarketCoinCategoryEntity(categoryID: 'number', categoryName: 'Number'),
  MarketCoinCategoryEntity(
      categoryID: 'decentralized-options', categoryName: 'Options'),
  MarketCoinCategoryEntity(categoryID: 'oracle', categoryName: 'Oracle'),
  MarketCoinCategoryEntity(categoryID: 'other', categoryName: 'Other'),
  MarketCoinCategoryEntity(
      categoryID: 'decentralized-perpetuals', categoryName: 'Perpetuals'),
  MarketCoinCategoryEntity(
      categoryID: 'dot-ecosystem', categoryName: 'Polkadot Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'polygon-ecosystem', categoryName: 'Polygon Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'prediction-markets', categoryName: 'Prediction Markets'),
  MarketCoinCategoryEntity(
      categoryID: 'privacy-coins', categoryName: 'Privacy Coins'),
  MarketCoinCategoryEntity(categoryID: 'protocol', categoryName: 'Protocol'),
  MarketCoinCategoryEntity(
      categoryID: 'real-estate', categoryName: 'Real Estate'),
  MarketCoinCategoryEntity(
      categoryID: 'rebase-tokens', categoryName: 'Rebase Tokens'),
  MarketCoinCategoryEntity(
      categoryID: 'reddit-points', categoryName: 'Reddit Points'),
  MarketCoinCategoryEntity(
      categoryID: 'remittance', categoryName: 'Remittance'),
  MarketCoinCategoryEntity(categoryID: 'retail', categoryName: 'Retail'),
  MarketCoinCategoryEntity(
      categoryID: 'seigniorage', categoryName: 'Seigniorage'),
  MarketCoinCategoryEntity(
      categoryID: 'smart-contract-platform',
      categoryName: 'Smart Contract Platform'),
  MarketCoinCategoryEntity(
      categoryID: 'social-money', categoryName: 'Social Money'),
  MarketCoinCategoryEntity(categoryID: 'software', categoryName: 'Software'),
  MarketCoinCategoryEntity(
      categoryID: 'solana-ecosystem', categoryName: 'Solana Ecosystem'),
  MarketCoinCategoryEntity(categoryID: 'sports', categoryName: 'Sports'),
  MarketCoinCategoryEntity(
      categoryID: 'stablecoins', categoryName: 'Stablecoins'),
  MarketCoinCategoryEntity(categoryID: 'storage', categoryName: 'Storage'),
  MarketCoinCategoryEntity(
      categoryID: 'synthetic-assets', categoryName: 'Synthetic Issuer'),
  MarketCoinCategoryEntity(categoryID: 'synths', categoryName: 'Synths'),
  MarketCoinCategoryEntity(
      categoryID: 'technology-science', categoryName: 'Technology & Science'),
  MarketCoinCategoryEntity(
      categoryID: 'terra-ecosystem', categoryName: 'Terra Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'tokenized-btc', categoryName: 'Tokenized BTC'),
  MarketCoinCategoryEntity(
      categoryID: 'tokenized-gold', categoryName: 'Tokenized Gold'),
  MarketCoinCategoryEntity(
      categoryID: 'tokenized-products', categoryName: 'Tokenized Products'),
  MarketCoinCategoryEntity(categoryID: 'tokensets', categoryName: 'TokenSets'),
  MarketCoinCategoryEntity(categoryID: 'tourism', categoryName: 'Tourism'),
  MarketCoinCategoryEntity(
      categoryID: 'usd-stablecoin', categoryName: 'USD Stablecoin'),
  MarketCoinCategoryEntity(
      categoryID: 'us-election-2020', categoryName: 'US Election 2020'),
  MarketCoinCategoryEntity(categoryID: 'utokens', categoryName: 'uTokens'),
  MarketCoinCategoryEntity(
      categoryID: 'virtual-reality', categoryName: 'Virtual Reality'),
  MarketCoinCategoryEntity(categoryID: 'wallets', categoryName: 'Wallets'),
  MarketCoinCategoryEntity(
      categoryID: 'wrapped-tokens', categoryName: 'Wrapped-Tokens'),
  MarketCoinCategoryEntity(
      categoryID: 'yearn-yfi-partnerships-mergers',
      categoryName: 'Yearn Ecosystem'),
  MarketCoinCategoryEntity(
      categoryID: 'yield-aggregator', categoryName: 'Yield Aggregator'),
  MarketCoinCategoryEntity(
      categoryID: 'yield-farming', categoryName: 'Yield Farming'),
];
