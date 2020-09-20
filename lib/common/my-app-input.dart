import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class MyAppInput extends StatelessWidget {
  final String labelText;
  final Function(String) validator;
  final Function(String) onChanged;
  MyAppInput({this.labelText, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            labelText.toUpperCase(),
            style: TextStyle(
              color: MyColors.disabledGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          style: TextStyle(
            color: MyColors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: MyColors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: MyColors.white),
            ),
            errorMaxLines: 3,
            errorStyle: TextStyle(
              color: MyColors.red,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.red,
              ),
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.red,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
