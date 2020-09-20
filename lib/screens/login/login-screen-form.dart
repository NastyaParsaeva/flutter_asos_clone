import 'dart:developer';

import 'package:asos_clone/common/my-app-input.dart';
import 'package:asos_clone/models/Login.model.dart';
import 'package:flutter/material.dart';

const Pattern emailPattern = r'^\S+@\S+$';

class LoginScreenForm extends StatefulWidget {
  final Function onSubmit;

  const LoginScreenForm({Key key, this.onSubmit}) : super(key: key);

  @override
  _LoginScreenFormState createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  final _formKey = GlobalKey<FormState>();

  Login loginForm = Login();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppInput(
            labelText: 'Адрес электронной почты:',
            validator: (value) {
              if (value.isEmpty) {
                return 'Ой! Здесь вам надо указать адрес электронной почты';
              }
              final emailRegexp = new RegExp(emailPattern);
              if (!emailRegexp.hasMatch(value)) {
                return 'Пожалуйста, укажите свой правильный адрес электронной почты';
              }
              return null;
            },
            onChanged: (String value) {
              loginForm.email = value;
            },
          ),
          MyAppInput(
            labelText: 'Пароль',
            validator: (value) {
              if (value.isEmpty) {
                return 'Здесь требуется пароль';
              }
              return null;
            },
            onChanged: (String value) {
              loginForm.password = value;
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
                    if (_formKey.currentState.validate()) {
                      widget.onSubmit(loginForm);
                    }
                  },
                  child: Text('Войти'.toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
