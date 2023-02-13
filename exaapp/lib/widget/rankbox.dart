import 'package:flutter/material.dart';

class RankBox extends StatelessWidget {
  final String rank,
      percentage,
      baseToken_h,
      priceUSD_h,
      dexID_h,
      chainID_h,
      baseToken_l,
      priceUSD_l,
      dexID_l,
      chainID_l;
  const RankBox(
      {super.key,
      required this.rank,
      required this.percentage,
      required this.baseToken_h,
      required this.priceUSD_h,
      required this.dexID_h,
      required this.chainID_h,
      required this.baseToken_l,
      required this.priceUSD_l,
      required this.dexID_l,
      required this.chainID_l});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
    );
  }
}
