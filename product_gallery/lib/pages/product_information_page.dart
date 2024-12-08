import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductInformationPage extends StatefulWidget {
  final Product product;

  const ProductInformationPage({super.key, required this.product});

  @override
  State<ProductInformationPage> createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product Information"),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      widget.product.imageUrl!,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "PHP ${widget.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.description
                  )
                ],
              )),
        ));
  }
}
