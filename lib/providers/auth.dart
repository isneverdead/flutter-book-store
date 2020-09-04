import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  // Auth() {
  //   getIsAuth();
  // }
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  String _username;
  String _token;
  // void getIsAuth() {
  //   isAuth;
  // }

  bool get isAuth {
    // if (token != null) {
    //   return true;
    // }
    print('============is Auth : $token ============');
    // return false;

    return token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(String email, String password) async {
    const url = 'http://goapp.iniakbar.xyz/api/auth/login';
    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      print('== Login Response : ${response.body} ==');
      final responseData = json.decode(response.body);
      // _responseLoginCode = response.statusCode;

      if (responseData['error'] != null) {
        print(responseData['error']);
        // _responseLoginData = responseData['error'];
      }
      _username = responseData['data']['id'].toString();
      _token = responseData['meta']['token'].toString();
      // _username = responseData['data']['name'];
      // print(_token);

      final prefs = await SharedPreferences.getInstance();
      // final userData = json.encode({
      //   'token': _token,
      //   'username': _username,
      // });
      prefs.setString('userData', _token);
      notifyListeners();
      final extractedUserData = prefs.getString('userData');
      // print(extractedUserData);
      print('Token Key : ' + extractedUserData.toString());
      print('============Logged In============');
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    // print(isAuth);
    return _authenticate(email, password);
  }

  Future<bool> tryAutoLogin() async {
    print('============Try Auto Login============');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userData') == null) {
      print('============Try Auto Login: False============');

      return false;
    }
    final extractedUserData = prefs.getString('userData');
    print('print dari tryAutoLogin :' + extractedUserData.toString());

    // print(extractedUserData);
    _token = extractedUserData;
    // _username = extractedUserData['username'];
    notifyListeners();
    print('============Try Auto Login: True============');
    return true;
  }

  Future<void> logout() async {
    _token = '';
    _username = '';
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print('============Logged Out============');
    notifyListeners();
  }

  Future<void> _register(String email, String password, String username) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    const url = 'http://goapp.iniakbar.xyz/api/auth/register';
    try {
      final response = await http.post(
        url,
        headers: requestHeaders,
        body: json.encode(
          {'email': email, 'password': password, 'name': username},
        ),
      );
      // print(response.body);
      final responseData = json.decode(response.body);

      notifyListeners();
      // print(extractedUserData);
      print('============Registered============');
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password, String username) async {
    print(isAuth);
    return _register(email, password, username);
  }
}
