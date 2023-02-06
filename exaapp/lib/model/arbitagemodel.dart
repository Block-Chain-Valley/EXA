class ArbitageModel {
  final String exchange1, exchange2, gap;
  ArbitageModel.fromJson(Map<String, dynamic> json)
      : exchange1 = json['exchange1'],
        exchange2 = json['exchange2'],
        gap = json['gap'];
}
