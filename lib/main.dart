import 'package:cs_currency_api_1/functions/fetch_currency_data.dart';
import 'package:cs_currency_api_1/pages/conversion_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrencyProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const ConversionPage(),
      ),
    );
  }
}
