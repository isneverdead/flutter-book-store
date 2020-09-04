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
import './providers/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isUser = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCheck();
  }

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
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'bookStore',
          theme: ThemeData(
            // primaryColor: Colors.red[700],
            primaryColorLight: Color.fromARGB(255, 63, 197, 240),
            accentColor: Colors.amber[400],
          ),
          home: SplashScreen(0),
          //  auth.isAuth
          //     ? HomePage()
          //     : FutureBuilder(
          //         future: auth.tryAutoLogin(),
          //         builder: (ctx, authResultSnapshot) =>
          //             authResultSnapshot.connectionState ==
          //                     ConnectionState.waiting
          //                 ? LoginPage()
          //                 : RegisterPage(),
          //       ),
          routes: {
            HomePage.routeName: (ctx) => HomePage(),
            CartPage.routeName: (ctx) => CartPage(),
            ListBooksPage.routeName: (ctx) => ListBooksPage(),
            RegisterPage.routeName: (ctx) => RegisterPage(),
            LoginPage.routeName: (ctx) => LoginPage(),
            BookDetailPage.routeName: (ctx) => BookDetailPage(),
          },
        ),
        // child:
      ),
    );
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('userData') != null) {
      setState(() {
        _isUser = true;
      });
    }
  }
}
