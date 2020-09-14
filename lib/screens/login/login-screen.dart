import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Text(
              'Добро пожаловать в интернет-магазин!'.toUpperCase(),
              style: TextStyle(
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Адрес электронной почты:'.toUpperCase(),
                      style: TextStyle(
                        color: MyColors.disabledGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: MyColors.dividerGray),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ой! Здесь вам надо указать адрес электронной почты';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Пароль:'.toUpperCase(),
                      style: TextStyle(
                        color: MyColors.disabledGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: MyColors.dividerGray),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Здесь требуется пароль';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            // if (_formKey.currentState.validate()) {
                            //   // Process data.
                            // }
                            Navigator.pushNamed(
                              context,
                              '/product-list',
                              arguments: {},
                            );
                          },
                          child: Text('Войти'.toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // backgroundColor: MyColors.black,
    );
  }
}
