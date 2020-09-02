import 'package:book_store/pages/book_detail_page.dart';
import 'package:book_store/pages/cart_page.dart';
import 'package:book_store/pages/home_page.dart';
import 'package:book_store/pages/list_books.dart';
import 'package:book_store/pages/login_page.dart';
import 'package:book_store/pages/register_page.dart';
import 'package:book_store/providers/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
// import 'package:fooder/screen/checkout_screen.dart';
// import './screen/home_screen.dart';
// import './screen/promo_screen.dart';
// import './screen/detail_resto_page.dart';
// import './providers/foods.dart';
// import './screen/success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // const color = const Color.fromRGBO(232, 76, 79, 0);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Books(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'bookStore',
        theme: ThemeData(
          // primaryColor: Colors.red[700],
          primaryColorLight: Color.fromARGB(255, 63, 197, 240),
          accentColor: Colors.amber[400],
        ),
        home: LoginPage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          CartPage.routeName: (ctx) => CartPage(),
          ListBooksPage.routeName: (ctx) => ListBooksPage(),
          RegisterPage.routeName: (ctx) => RegisterPage(),
          LoginPage.routeName: (ctx) => LoginPage(),
          BookDetailPage.routeName: (ctx) => BookDetailPage(),
        },
      ),
    );
  }
}
