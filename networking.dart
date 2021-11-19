import 'package:http/http.dart';
import 'dart:convert';

//by having this class, we can use it for other things in the future if we need more networking function
class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
