import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future getExchangeRates() async {
  String baseCurrency = "USD";
  String apiUrl = 'https://api.exchangerate-api.com/v4/latest/$baseCurrency';

  try {
    final response = await Dio().get(apiUrl);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.toString());
      debugPrint("Response inside getExchangeRates: $data");
      return data;
    } else {
      throw 'Failed to fetch exchange rates';
    }
  } catch (e) {
    throw 'Error fetching exchange rates: $e';
  }
}
