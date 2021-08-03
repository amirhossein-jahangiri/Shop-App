import 'package:flutter/material.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsOverViewScreen(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
      },
    );
  }
}
