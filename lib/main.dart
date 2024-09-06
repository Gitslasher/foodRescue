import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_product_card.dart';
import 'package:flutter_application_1/screens/penjual_chat_screen.dart';
import 'package:flutter_application_1/screens/penjual_verification_screen.dart';
import 'package:flutter_application_1/screens/peran_screen.dart';
import 'screens/home_screen.dart';
import 'screens/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/product.dart';// Import your chat screen

class ProductProvider with ChangeNotifier {
  // Add your product data and business logic here
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Rescue',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins', // Apply the Poppins font globally
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PeranScreen(),
        '/chat': (context) => ChatScreen(),
        '/penjualchat': (context) => PenjualChatScreen(),
        '/store': (context) => PenjualVerificationScreen(),
        '/shopping' : (context) => HomeScreen(),
        '/addproductcard' : (context) => AddProductCard(),// Define route to ChatScreen
        // Define other routes here
      },
    );
  }
}
