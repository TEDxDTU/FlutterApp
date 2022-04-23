import 'dart:convert';
// import 'dart:html';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';

import '../models/discover.dart';
import '../models/recent_update.dart';
import 'package:http/http.dart' as http;

class DiscoverProvider extends ProviderTemplate<Discover> {
  @override
  Discover findById(String id) {
    return data.firstWhere((element) => element.id == id);
    // throw UnimplementedError();
  }

  @override
  Future<List<Discover>> getData() async {
    final url = Uri.parse(nodeServerBaseUrl + '/api/recent-updates/discover');
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (response.statusCode >= 400) {
      throw Exception(extractedData['msg']);
    }
    print(extractedData['discoverData']);
    final data = (extractedData['discoverData'] as List)
        .map((element) => Discover.fromMap(element))
        .toList();
    print(data);
    return data;
  }
}
