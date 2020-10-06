import 'package:flutter/material.dart';

class Filter {
  final int startYear;
  final int endYear;
  final String gender;
  final List<String> countries;
  final List<String> colors;

  Filter(
      {@required this.startYear,
      @required this.endYear,
      @required this.gender,
      @required this.countries,
      @required this.colors});
  factory Filter.fromJson(Map<String, dynamic> jsonData) {
    List<String> _countries = [];
    List<String> _colors = [];
    for (var x = 0; x < jsonData['colors'].length; x++) {
      _colors.add(jsonData['colors'][x]);
    }
    for (var x = 0; x < jsonData['countries'].length; x++) {
      _countries.add(jsonData['countries'][x]);
    }
    return Filter(
        startYear: jsonData['start_year'],
        endYear: jsonData['end_year'],
        gender: jsonData['gender'],
        countries: _countries,
        colors: _colors);
  }
}
