import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  final double loadingTime;
  SplashScreen(this.loadingTime);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isUser = false;
  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('userData') != null) {
      setState(() {
        _isUser = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: widget.loadingTime.toInt()), () {
      _initCheck();
      // Navigator.of(context).pushReplacementNamed(
      //     widget.isUser ? HomePage.routeName : LoginPage.routeName);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (c) => _isUser ? HomePage() : LoginPage()));
      // widget.isUser ? HomePage.routeName : LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColorLight,
            // valueColor: Animation<Color>(
            //     Theme.of(context).primaryColorLight),
          ),
        ),
      ),
    );
  }
}
