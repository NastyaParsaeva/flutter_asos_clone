import 'dart:convert';
import 'dart:developer';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:asos_clone/models/Login.model.dart';
import 'package:asos_clone/models/UserData.model.dart';
import 'package:asos_clone/screens/login/login-screen-form.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<UserData> authentificate(String email, String password) async {
  final http.Response response = await http.post(
    'http://192.168.1.69:8000/auth',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "password": password,
    }),
  );

  if (response.statusCode == 200) {
    return UserData.fromJson(json.decode(response.body));
  } else {
    throw Exception(json.decode(response.body));
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  'Добро пожаловать в интернет-магазин!'.toUpperCase(),
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              loginError != null
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          loginError,
                          style: TextStyle(color: MyColors.white),
                        ),
                      ),
                      color: MyColors.red.withOpacity(0.4),
                    )
                  : SizedBox.shrink(),
              LoginScreenForm(
                onSubmit: (Login loginForm) async {
                  try {
                    final UserData response = await authentificate(
                        loginForm.email, loginForm.password);
                    if (response.firstName != null &&
                        response.lastName != null) {
                      Navigator.pushNamed(
                        context,
                        '/product-list',
                        arguments: {},
                      );
                    }
                  } catch (error) {
                    setState(() => loginError = error.message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
