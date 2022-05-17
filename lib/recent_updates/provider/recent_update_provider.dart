import 'dart:convert';
// import 'dart:html';

import 'package:tedx_dtu_app/global/providers/provider_template.dart';
import 'package:tedx_dtu_app/helpers/constants/constants.dart';

import '../models/recent_update.dart';
import 'package:http/http.dart' as http;

class RecentUpdateProvider extends ProviderTemplate<RecentUpdate> {
  @override
  RecentUpdate findById(String id) {
    return data.firstWhere((element) => element.id == id);
    // throw UnimplementedError();
  }

  @override
  Future<List<RecentUpdate>> getData() async {
    final url = Uri.parse(nodeServerBaseUrl + '/api/recent-updates/updates');
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (response.statusCode >= 400) {
      throw Exception(extractedData['msg']);
    }
    print(extractedData['recentUpdates']);
    final data = (extractedData['recentUpdates'] as List)
        .map((element) => RecentUpdate.fromMap(element))
        .toList();
    print(data);
    return data;
  }
}
