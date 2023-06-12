import 'dart:developer';
import 'constant.dart';
import 'package:http/http.dart' as http;
import '/model/poli_item.dart';

class ApikuService {
  Future<List<PoliItemm>?> getItem() async {
    try {
      var url = Uri.parse(ApiConstants.baseurl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // ignore: no_leading_underscores_for_local_identifiers
        List<PoliItemm> _model = PoliItemmFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
