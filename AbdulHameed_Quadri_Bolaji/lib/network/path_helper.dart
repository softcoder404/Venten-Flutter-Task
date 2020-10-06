import 'package:csv/csv.dart';
import 'package:flutter/services.dart';


class PathHelpers {
  static Future<List<List<dynamic>>> loadCsv() async {
    final data = await rootBundle.loadString('assets/venten.csv');
    List<List<dynamic>> rowAsListOfValues =
        const CsvToListConverter().convert(data);
    return rowAsListOfValues;
  }
}

//6760
