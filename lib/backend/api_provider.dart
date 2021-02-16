import 'package:flutter/material.dart';
import 'package:gsg_api/backend/server.dart';
import 'package:gsg_api/models/comment.dart';
import 'package:gsg_api/models/product.dart';
import 'package:gsg_api/models/user.dart';

class ApiProvider extends ChangeNotifier {
  User user;
  List<Product> products;
  List<Comment> productComment;
  String likesCount;
  clearLikesAndComments() {
    this.likesCount = null;
    this.productComment = null;
    notifyListeners();
  }

  setProductComments(List<Comment> comments, String likesCount) {
    this.productComment = comments;
    this.likesCount = likesCount;
    notifyListeners();
  }

  setProducts(List<Product> products) {
    this.products = products;
    notifyListeners();
  }

  String selectedCountry = countries.first;
  selectCountry(String value) {
    this.selectedCountry = value;
    notifyListeners();
  }

  setUserMap(User user) {
    this.user = user;
    notifyListeners();
  }
}
