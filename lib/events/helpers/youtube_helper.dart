import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getYoutubeDetails(String url) async {
  var resp = await http
      .get(Uri.parse("https://www.youtube.com/oembed?url=$url&format=json"));
  return jsonDecode(resp.body);
}
