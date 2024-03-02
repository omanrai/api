import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  String url = "http://192.168.1.1:8080/api/products.php";
  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    var products = jsonDecode(response.body);

    return products;
  }
}
