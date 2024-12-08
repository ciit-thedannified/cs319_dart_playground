import 'package:cs319_dart_playground/models/product.dart';
import 'package:flutter/material.dart';

// To do's
// Add image based on the filipino food on Home.dart (Still can be changed if you want)
// Redesign if ever gusto mo

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 160,
        height: 160,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 56, 142, 60)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 103, 110, 96).withOpacity(0.7),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //Image Container
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  widget.product.imageUrl!,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,

                  // For no image/broken image
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: const Icon(Icons.broken_image, size: 50),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "PHP ${widget.product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
