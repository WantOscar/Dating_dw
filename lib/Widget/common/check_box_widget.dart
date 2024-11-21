import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isChecked,
      title: Text('이용약관 전체 동의'),
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: ThemeColor.warningText,
      checkColor: ThemeColor.fontColor,
    );
  }
}
