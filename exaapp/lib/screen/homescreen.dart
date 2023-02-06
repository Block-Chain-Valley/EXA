import 'package:exaapp/api_service/api_service.dart';
import 'package:exaapp/model/ArbitageModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<ArbitageModel>> gaps = ApiService.getGap();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "EXA",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Gap Ranking",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Menu(
                menu: 'Ranking',
                size: 20,
              ),
              Menu(
                menu: 'Exchange',
                size: 20,
              ),
              Menu(
                menu: 'Gap',
                size: 20,
              ),
              Menu(
                menu: 'Crypto',
                size: 20,
              ),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Menu(
                    menu: '$index',
                    size: 12,
                  ),
                  const Menu(
                    menu: 'Binance/Pancakeswap',
                    size: 12,
                  ),
                  const Menu(
                    menu: '3%',
                    size: 12,
                  ),
                  const Menu(menu: 'WBNB', size: 12),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final String menu;
  final double size;
  const Menu({
    super.key,
    required this.menu,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      menu,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
