import 'package:exaapp/models/data.dart';
import 'package:exaapp/services/api_sevives.dart';
import 'package:exaapp/widget/rankbox.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatelessWidget {
  RankScreen({super.key});
  final Future<List<Data>> datas = ApiService.getDatas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
          future: datas,
          /**builder: UI를 그려주는 함수 snapshot<Future type>의 상태를 알 수 있음.*/
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(child: makeList(snapshot)),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  ListView makeList(AsyncSnapshot<List<Data>> snapshot) {
    return ListView.separated(
      //builer:최적화된 ListView, 화면에 보이는 item을 그때 그때 맞게 렌더링해서 생성, seperated: 구분자를 추가해줌.
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var databox = snapshot.data![index];

        return RankBox(
            databox.rank,
            databox.percentage,
            databox.baseToken_h,
            databox.PriceUSD_h,
            databox.dexID_h,
            databox.chainID_h,
            databox.baseToken_l,
            databox.PriceUSD_l,
            databox.dexID_l,
            databox.chainID_l);
      },

      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
