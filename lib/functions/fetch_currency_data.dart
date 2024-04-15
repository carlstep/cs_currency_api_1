import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyProvider extends ChangeNotifier {
  Map<String, dynamic>? _currencies;

  // getter for Map of currencies
  Map<String, dynamic>? get currencies => _currencies;

  Future<void> fetchCurrencies() async {
    final url = Uri.parse('https://openexchangerates.org/api/currencies.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      _currencies = jsonDecode(response.body) as Map<String, dynamic>;
      notifyListeners();
    } else {
      throw Exception('failed to load currency data');
    }
  }
}
