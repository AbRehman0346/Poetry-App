import 'package:flutter/material.dart';

class XCheckBox extends StatelessWidget{
  final String title;
  bool value;
  void Function(bool? change) _onChange;

  XCheckBox({
    super.key,
    required this.title,
    required this.value,
    required void Function(bool? change) onChange,
  }) :
    _onChange = onChange
  ;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Checkbox(value: value, onChanged: _onChange,),
        Text(title)
      ],
    );
  }
}