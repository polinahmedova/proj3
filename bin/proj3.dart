import 'package:proj3/proj3.dart' as proj3;
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
final url = Uri.https(
'dummyjson.com',
'/products',
);
final response = await http.get(url);

Map<String, dynamic> jsonData = convert.jsonDecode(response.body);


List<dynamic> products = jsonData["products"];
int sum = 0;

List<int> instock = products.map((p) => p["stock"] as int).toList();

sum = instock.reduce((acc, p) => acc + p);
print("in stock: $sum");
}

