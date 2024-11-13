import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CarsData with ChangeNotifier {
  Map<String, dynamic> _cars = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get cars => _cars;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchCarsInfo async {
    final response = await get(
      Uri.parse(
          'https://dl.dropboxusercontent.com/s/m8saoxxi9fyz7lj/cars.json?dl=0'),
    );

    if (response.statusCode == 200) {
      try {
        _cars = jsonDecode(response.body);
        _error = false;
      } catch (error) {
        _error = true;
        _errorMessage = error.toString();
        _cars = {};
      }
    } else {
      _error = true;
      _errorMessage = 'error: file not found 404';
      _cars = {};
    }
    notifyListeners();
  }
}
