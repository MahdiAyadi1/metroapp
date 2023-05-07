// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../myvariables.dart';

class InputWelcome extends StatelessWidget {
  final List<DropdownMenuItem<String>>? list;
  final void Function(Object?)? onChange;
  final String? selected;
  final Text? hintText;
  const InputWelcome(
      {super.key,
      required this.list,
      required this.onChange,
      required this.selected,
      required this.hintText,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 45),
      decoration: BoxDecoration(
        color: MyVariables.backgroundColor,
        borderRadius: BorderRadius.circular(66),
      ),
      width: 355,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton(
        
        //dropdownColor: Colors.grey[200],
        value: selected,
        hint: hintText,
        itemHeight: 60,
        style: TextStyle(fontSize: 18.5, color: MyVariables.textColor),
        isExpanded: true,
        items: list,
        onChanged: onChange,
      ),
    );
  }
}
