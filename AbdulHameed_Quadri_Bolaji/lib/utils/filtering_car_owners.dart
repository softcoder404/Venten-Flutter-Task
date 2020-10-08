import 'package:AbdulHameed_Quadri_Bolaji/models/CarUsers.dart';
import 'package:AbdulHameed_Quadri_Bolaji/models/Filter.dart';
import 'package:flutter/foundation.dart';

class FilteringCarOwner {
  static List<CarUsers> basedOnSelectedFilter(
      List<CarUsers> allCarUsers, Filter filter) {
    FilterCarOwners filterCarOwners =
        FilterCarOwners(allCarUsers: allCarUsers, filter: filter);
    //check first condition
    filterCarOwners.basedOnYear();
  }
}

class FilterCarOwners {
  List<CarUsers> allCarUsers;
  Filter filter;
  FilterCarOwners({@required this.allCarUsers, @required this.filter});
//check condition 1
  void basedOnYear() {
    allCarUsers = allCarUsers
        .where((carUser) =>
            carUser.carModelYear >= filter.startYear &&
            carUser.carModelYear <= filter.endYear)
        .toList();
  }

//check condition 2
  void basedOnGender() {
    if (filter.countries.isNotEmpty) {
      allCarUsers = allCarUsers
          .where((user) => filter.countries.contains(user.country))
          .toList();
    }
  }

//check condition 3
  void basedOnColors() {
    if (filter.colors.isNotEmpty) {
      allCarUsers = allCarUsers
          .where((user) => filter.colors.contains(user.carColor))
          .toList();
    }
  }

//check condition 4
  void basedOnCountries() {
    if (filter.countries.isNotEmpty) {
      allCarUsers = allCarUsers
          .where((user) => filter.countries.contains(user.country))
          .toList();
    }
  }
}
