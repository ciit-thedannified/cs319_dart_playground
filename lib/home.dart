import 'package:flutter/material.dart';
import 'card.dart'; 

// To do's 
//Search Bar 

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final List<Map<String,String>> _products = [
    {"title": "Adobo", "price": "\$100"},
    {"title": "Sinigang na Baboy", "price": "\$200"},
    {"title": "Menudo", "price": "\$300"},
    {"title": "Sisig", "price": "\$400"},
    {"title": "Kare-Kare", "price": "\$500"},
    {"title": "Lechon", "price": "\$600"},
    {"title": "Example", "price": "\$700"},

  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home"),
      centerTitle: true,
    ),
    body: Column(
      children: [ 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField( 
            decoration: InputDecoration(
              border: OutlineInputBorder( 
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
        ),

        Expanded(
          child: GridView.builder( 
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              ),
             itemCount: _products.length,
             itemBuilder: (context, index){
            return ProductCard(
              title: _products[index]['title'] ?? 'No title',
              price: _products[index]['price'] ?? 'No Title',
              onTap: () {
                print('Tapped on ${_products[index]['title']}');
                },
              );
            },
          ),
        ),
      ],
    ),
  );
  }
}
