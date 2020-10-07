import '../models/CarUsers.dart';
import '../models/Filter.dart';
import '../network/network_helper.dart';
import '../network/path_helper.dart';
import 'package:scoped_model/scoped_model.dart';

class AppScopedModel extends Model {
  //creating a list of filter
  List<Filter> _filters = [];
  List<Filter> get filter => _filters; // filter list getter
  //setting a loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading; //loading state getter
  //creating a list of car users in usa
  List<CarUsers> _carUsers = [];
  List<CarUsers> get carUsers => _carUsers; // list of car users getter
  List<CarUsers> _filteredCarUsers = [];
  List<CarUsers> get filteredCarUsers => _filteredCarUsers;
//get filters method
  Future<void> getFilters() async {
    try {
      toggleLoadingState(true);
      List<Filter> filters = await NetworkHelper.fetchFilters();
      if (filters != null) {
        _filters = filters;
        toggleLoadingState(false);
      }
    } catch (e) {
      print('error report :' + e.toString());
      toggleLoadingState(false);
    }
  }

//get list of car users method
  Future<void> getListOfCarUsers() async {
    try {
      //do something
      toggleLoadingState(true);
      var dynamicCarUsers = await PathHelpers.loadCsv();
      for (int index = 1; index < dynamicCarUsers.length; index++) {
        _carUsers.add(CarUsers.fromDynamicList(dynamicCarUsers[index]));
      }
      toggleLoadingState(false);
    } catch (e) {
      //print error
      print(e.toString());
    }
  }

  //filter list
  void filterCarUsers(List<CarUsers> carUsers, Filter filters) {
    //filter list based on date range
    toggleLoadingState(true);
    _filteredCarUsers = carUsers
        .where((user) =>
            user.carModelYear >= filters.startYear &&
            user.carModelYear <= filters.endYear)
        .toList();
    if (filters.gender != '') {
      _filteredCarUsers = _filteredCarUsers
          .where((user) => user.gender == filters.gender)
          .toList();
      notifyListeners();
    }
    if (filters.countries.isNotEmpty) {
      _filteredCarUsers = _filteredCarUsers
          .where((user) => filters.countries.contains(user.country))
          .toList();
      notifyListeners();
    }
    if (filters.colors.isNotEmpty) {
      _filteredCarUsers = _filteredCarUsers
          .where((user) => filters.colors.contains(user.carColor))
          .toList();
      notifyListeners();
    }
    toggleLoadingState(false);
  }

  void toggleLoadingState(bool state) {
    _isLoading = state;
    notifyListeners();
  }
}
