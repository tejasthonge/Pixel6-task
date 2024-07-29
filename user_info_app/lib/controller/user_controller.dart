


import 'package:flutter/material.dart';

import '../model/user_model/user_model.dart';
import '../services/api_services.dart';

class UserController extends ChangeNotifier {
  List<UserModel> _allUsers = [];
  List<UserModel> _filteredUsers = [];
  int _batchSize = 10;
  int _currentPage = 0;

  Future<void> fetchUsers() async {
    _allUsers = await fetchUsersFromApi();
    _filteredUsers = _allUsers;
    notifyListeners();
  }

  List<UserModel> get currentUsers {
    int start = _currentPage * _batchSize;
    int end = start + _batchSize;
    return _filteredUsers.sublist(
        start, end > _filteredUsers.length ? _filteredUsers.length : end);
  }

  void nextBatch() {
    if ((_currentPage + 1) * _batchSize < _filteredUsers.length) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousBatch() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }

  void sortById() {
    _filteredUsers.sort((idOfUserOne,idOfUserTwo) => idOfUserOne.id!.compareTo(idOfUserTwo.id!));  
    notifyListeners();
  }

  void sortByName() {
    _filteredUsers.sort((firstNameOfUserOne, firstNameOfUserTwo) => firstNameOfUserOne.firstName!.compareTo(firstNameOfUserTwo.firstName!));
    notifyListeners();
  }

  void sortByAge() {
    _filteredUsers.sort((ageOfUserOne, ageOfUserTwo) => ageOfUserOne.age!.compareTo(ageOfUserTwo.age!));
    notifyListeners();
  }

  void filterByGender(String? gender) {
    if (gender != null && gender != "None") {
      _filteredUsers = _allUsers
          .where((user) => user.gender!.toLowerCase() == gender.toLowerCase())
          .toList();
    } else {
      _filteredUsers = _allUsers;
    }
    _currentPage = 0; 
    notifyListeners();
  }

  void filterByCountry(String? country) {
    if (country != null && country != "None") {
      _filteredUsers = _allUsers
          .where((user) =>
              user.address!.country!.toLowerCase() == country.toLowerCase())
          .toList();
    } else {
      _filteredUsers = _allUsers;
    }
    _currentPage = 0; 
    notifyListeners();
  }
}
