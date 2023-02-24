import 'package:flutter/material.dart';

import 'myvariables.dart';

class InputWelcome extends StatelessWidget {
  final List<DropdownMenuItem<String>>? list;
  final void Function(Object?)? OnChange;
  final String? selectLigne;
  final Text? hintText;
  const InputWelcome(
      {super.key,
      required this.list,
      required this.OnChange,
      required this.selectLigne,
      required this.hintText,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: MyVariables.backgroundColor,
        borderRadius: BorderRadius.circular(66),
      ),
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButton(
        //dropdownColor: Colors.grey[200],
        value: selectLigne,
        hint: hintText,
        itemHeight: 60,
        style: TextStyle(fontSize: 18.5, color: MyVariables.textColor),
        isExpanded: true,
        items: list,
        onChanged: OnChange,
      ),
    );
  }
}
