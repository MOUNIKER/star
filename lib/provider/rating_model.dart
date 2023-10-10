import 'package:flutter/material.dart';

class RatingModel extends ChangeNotifier {
  double _rating = 0.0;

  double get rating => _rating;

  void setRating(double value) {
    _rating = value;
    notifyListeners();
  }
}
