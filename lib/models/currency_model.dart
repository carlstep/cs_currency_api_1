class Currency {
  final String currencyCode;
  final String currencyName;

  Currency(
    this.currencyCode,
    this.currencyName,
  );

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      json['currencyCode'] as String,
      json['currencyName'] as String,
    );
  }
}
