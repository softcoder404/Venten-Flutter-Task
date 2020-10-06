import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/Filter.dart';

class NetworkHelper {
  static Future<List<Filter>> fetchFilters() async {
    List<Filter> _filterModels = [];
    final String _url = "https://ven10.co/assessment/filter.json";
    try {
      http.Response response = await http.get(_url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = json.decode(response.body);
        responseBody.map((filter) {
          _filterModels.add(Filter.fromJson(filter));
        }).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    return _filterModels;
  }
}
