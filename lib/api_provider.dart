import 'package:flutter/material.dart';
import 'package:gsg_api/models/user.dart';

class ApiProvider extends ChangeNotifier {
  List<User> users = [];
  User selectedUser;
  setUsers(List<User> users) {
    this.users = users;
    notifyListeners();
  }

  setSelectedUser(User user) {
    this.selectedUser = user;
    notifyListeners();
  }

  clearSelectedUser() {
    this.selectedUser = null;
    notifyListeners();
  }
}
