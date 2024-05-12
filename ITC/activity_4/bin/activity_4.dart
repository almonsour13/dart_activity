import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  var apiUrl = "https://api.jikan.moe/v4/top/anime";
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    print("Request failed with status: ${response.statusCode}");
    return {}; 
  }
}

void main() async {
  var data = await fetchData();
  
  if (data != null && data['data'] != null) {
    print("\x1B[32mTop ${data['data'].length} Anime\x1B[0m");
    var items = data['data'];
    var i = 1;
    for (var item in items) {
      print("${i}: ${item['title']}");
      i++;
    }
  } else {
    print('Failed to fetch data.');
  }
}

