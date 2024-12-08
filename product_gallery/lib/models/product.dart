import 'package:cs319_dart_playground/exceptions/product_exceptions.dart';

const _defaultDescription = "Lorem ipsum odor amet, consectetuer adipiscing elit. Imperdiet amet ex eleifend pharetra cubilia sociosqu. Curabitur curabitur sem nunc conubia magnis litora dictum sem. Eget primis neque in tortor quam dis eget. Elementum mattis lacinia faucibus magna nec sit venenatis vel. Nascetur conubia lobortis ut sed; turpis nullam porttitor curae vivamus. Sit suscipit porta dignissim et mattis curabitur. Neque lacus pharetra, aliquam suspendisse enim dis.";

class Product {
  late String name;
  late double price;
  late String description;
  late String? imageUrl;

  Product({
    this.name = 'Product Name',
    this.price = 0,
    this.description = _defaultDescription,
    this.imageUrl
  }) {
    if (price < 0) throw NegativePriceException();
  }

}