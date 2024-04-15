import 'package:cs_currency_api_1/functions/fetch_currency_data.dart';
import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final _currencyProvider = CurrencyProvider();

  @override
  void initState() {
    super.initState();
    _currencyProvider.fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convert'),
      ),
      body: FutureBuilder<void>(
        future: _currencyProvider.fetchCurrencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final currencies = _currencyProvider.currencies;
            if (currencies == null) {
              return const Center(
                child: Text('Error - failed to load currency data'),
              );
            }
            return ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currencyCode = currencies.keys.elementAt(index);
                final currencyName = currencies[currencyCode];
                return CurrencyCard(
                  currencyName: currencyName,
                  currencyCode: currencyCode,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.currencyName,
    required this.currencyCode,
  });

  final String currencyName;
  final String currencyCode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(currencyName),
      subtitle: Text(currencyCode),
    );
  }
}
