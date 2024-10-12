import 'package:flutter/material.dart';
import 'card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _products = [
    {"title": "Adobo", "price": "\$100","image":"./images/Adobo.jpg"},
    {"title": "Sinigang na Baboy", "price": "\$200","image":"./images/sinigang-baboy.jpg"},
    {"title": "Menudo", "price": "\$300"},
    {"title": "Sisig", "price": "\$400"},
    {"title": "Kare-Kare", "price": "\$500"},
    {"title": "Lechon", "price": "\$600"},
    {"title": "Example", "price": "\$700"},
  ];

  List<Map<String, String>> _filteredProducts = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;

    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _products.where((product) {
        return product["title"]!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        titleTextStyle: TextStyle(fontSize: 22),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
            child: TextField(
              controller: _searchController,
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
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  title: _filteredProducts[index]['title'] ?? 'No title',
                  price: _filteredProducts[index]['price'] ?? 'No Title',
                  imageURL: _filteredProducts[index]['image'] ?? '',
                  onTap: () {
                    print('Tapped on ${_filteredProducts[index]['title']}');
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
