import 'package:cs319_dart_playground/models/product.dart';
import 'package:cs319_dart_playground/pages/main_page.dart';
import 'package:cs319_dart_playground/pages/product_information_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Food Catalog",
      routerConfig: GoRouter(initialLocation: '/', routes: <GoRoute>[
        GoRoute(
            path: '/',
            builder: (context, state) => const MainPage(),
            routes: <RouteBase>[
              GoRoute(
                  path: '/product',
                  builder: (context, state) {
                    var extraData = state.extra as Map<String, dynamic>?;

                    Product? s = extraData?['hello'];

                    return ProductInformationPage(product: s!);
                  }),
            ]),
      ]),
    );
  }
}
