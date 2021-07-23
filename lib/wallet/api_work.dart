//https://api.coingecko.com/api/v3/coins/

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getPrice() async {
  try {
    var url = "https://api.coingecko.com/api/v3/coins/bitcoin";
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var value = json['market_data']['current_price']['inr'].toString();
    return double.parse(value);
  } catch (e) {
    print(e.toString());
  }
}