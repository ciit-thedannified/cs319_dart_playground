class NegativePriceException implements Exception {
  String message;

  NegativePriceException({this.message = 'Product price cannot be less than zero.'});
}