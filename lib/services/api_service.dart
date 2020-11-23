import 'dart:convert';
import 'package:demo_httprequests/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  //SAVE PRODUCTS TO FIREBASE
  Future onproductsubmit(
      String productName, String price, String desc, String quantity) async {
    var payload = {
      'productname': productName,
      'price': price,
      'desc': desc,
      'quantity': quantity,
    };
    try {
      final http.Response response = await http.post(
        '${API.baseURL}/products.json',
        body: jsonEncode(payload),
      );
      var data = response.body;
      return jsonDecode(data);
    } catch (e) {
      throw e;
    }
  }

  //GET LIST OF ITEMS
  Future listproducts() async {
    http.Response response = await http.get('${API.baseURL}/products.json');
    var data = response.body;
    return jsonDecode(data);
  }
}
