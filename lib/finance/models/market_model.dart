

import 'package:flutter/foundation.dart';

class MarketData {
  List<Market> data;
  MarketData({this.data});

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
    data: List<Market>.from(json["data"].map((value)=>Market.fromJson(value))),
    );
  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((e) => e.toJson())),
  };
}

class Market {
/**
 *     ///
    var symbol: String? //交易对,
    ///
    var baseAsset: String? //基础币种,
    ///
    var quoteAsset: String? //计价币种,
    ///
    var priceChange: String? //24小时价格变化量,
    ///
    var priceChangePercent: String? //24小时价格变化百分比,
    ///
    var high: String? //最高价,
    ///
    var low: String? //最低价,
    ///
    var open: String? //开盘价,
    ///
    var latest: String? //最新成交价,
    ///
    var volume: String? //24小时成交量,
    ///
    var amount: String? //24小时成交额
    
    var usdt2cny: Double?

 */
  String symbol, baseAsset, quoteAsset, priceChangePercent, latest, volume;

  Market({this.symbol, this.baseAsset, this.quoteAsset, this.priceChangePercent, this.latest, this.volume});

  factory Market.fromJson(Map<String, dynamic>json) => Market(
    symbol: json["symbol"],
    baseAsset: json["baseAsset"],
    quoteAsset: json["quoteAsset"],
    priceChangePercent: json["priceChangePercent"],
    latest: json["latest"],
    volume: json["volume"],
  );

  Map<String, dynamic> toJson() => {
    "baseAsset": baseAsset,
    "quoteAsset": quoteAsset,
    "priceChangePercent": priceChangePercent,
    "latest": latest,
    "volume": volume,
  };

}