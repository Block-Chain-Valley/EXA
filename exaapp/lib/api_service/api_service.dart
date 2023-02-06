import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exaapp/model/ArbitageModel.dart';

class ApiService {
  static const String baseUrl = "url";
  static const String exchange1 = "exchange1";
  static const String exchange2 = "exchange2";
  static const String gap = "gap";

  static Future<List<ArbitageModel>> getGap() async {
    List<ArbitageModel> gapInstances = [];
    final url = Uri.parse(('$baseUrl/'));
    final response = await http.get(url);
    //비동기식 처리를 해야 함.이 코드는 꼭 수행이 완료되고 넘어가길 바라기 때문.
    //Future<Response> get(String URL) : get함수는 미래에 완료될 것이라는 것을 말함.처리되는 데 좀 걸린다는 말
    // 하지만 완료되었을때, 이 함수는 Response를 반환한다는 말.
    if (response.statusCode == 200) {
      late final List<dynamic> gaps = jsonDecode(response.body);
      for (var gap in gaps) {
        final instance = ArbitageModel.fromJson(gap);
        gapInstances.add(instance);
      }
      return gapInstances;
    }
    throw Error();
  }
}
