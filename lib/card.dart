import 'package:flutter/material.dart';

// To do's 
// Add image based on the filipino food on Home.dart (Still can be changed if you want)
//Redesign if ever gusto mo

class ProductCard extends StatefulWidget{
  final String title;
  final String price;
  final VoidCallback onTap;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
            child: Container(
              color: Colors.green[400],
              margin: EdgeInsets.all(8.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  widget.title,
                  style:TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.price,
                  style:TextStyle(
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