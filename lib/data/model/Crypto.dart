import 'package:flutter/foundation.dart';

class Crypto {
  String? id;
  String? name;
  String? symbol;
  double? changePercent24Hr;
  double? priceUsd;
  double? marketCapUsd;
  int? rank;

  Crypto(
    this.id,
    this.name,
    this.symbol,
    this.changePercent24Hr,
    this.priceUsd,
    this.marketCapUsd,
    this.rank,
  );

  factory Crypto.fromJsonObject(Map<String, dynamic> jsonObject) {
    return Crypto(
        jsonObject['id'],
        jsonObject['name'],
        jsonObject['symbol'],
        double.parse(jsonObject['changePercent24Hr']),
        double.parse(jsonObject['priceUsd']),
        double.parse(jsonObject['marketCapUsd']),
        int.parse(jsonObject['rank']));
  }
}
