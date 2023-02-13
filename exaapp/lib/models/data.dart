class Data {
  final String rank,
      percentage,
      baseToken_h,
      PriceUSD_h,
      dexID_h,
      chainID_h,
      baseToken_l,
      PriceUSD_l,
      dexID_l,
      chainID_l;
  Data.fromJson(Map<String, dynamic> json)
      : rank = json["rank"],
        percentage = json["percentage"],
        baseToken_h = json["high"]["baseToken"],
        PriceUSD_h = json["high"]["priceUsd"],
        dexID_h = json["high"]["dexId"],
        chainID_h = json["high"]["chainId"],
        baseToken_l = json["low"]["baseToken"],
        PriceUSD_l = json["low"]["priceUsd"],
        dexID_l = json["low"]["dexId"],
        chainID_l = json["low"]["chainId"];
}
/*
{
    "rank":"1",
    "percentage":"8.3%",
    "high": {
        "pairAddress":"liweutagwetaweraf / USDT/BNB",
        "baseToken":"BNBx",
        "chainId":"bsc",
        "dexId":"uniswap / binance",
        "priceUsd":"1234",
        "liquidity":"19240125",
        "ccxt_ticker":"BNB"
    },
    
    "low": {
        "pairAddress":"liweutagwetaweraf / USDT/BNB:230301",
        "baseToken":"BNBx / BNB",
        "chainId":"ethereum / binance",
        "dexId":"pancakeswap / binance",
        "priceUsd":"1234",
        "ccxt_ticker":"BNB"
    }
}
*/
