import 'package:flutter/material.dart';

/// 속성을 입력하기 위한 커스텀 텍스트 필드 위젯
/// 사용자의 속성 입력을 받기 위한 자체적인 컴포넌트
class PropertyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  const PropertyTextField({super.key, this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadiusDirectional.circular(12.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: TextField(
          controller: controller,
          cursorColor: Colors.black87,
          decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(fontSize: 15, color: Color(0xffafafaf)),
              border: InputBorder.none,
              fillColor: Color(0xffefefef),
              filled: true),
        ),
      ),
    );
  }
}
