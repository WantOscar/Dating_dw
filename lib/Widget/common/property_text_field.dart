import 'package:flutter/material.dart';

/// 속성을 입력하기 위한 커스텀 텍스트 필드 위젯
/// 사용자의 속성 입력을 받기 위한 자체적인 컴포넌트
class PropertyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final Widget? sufficIcon;
  // final bool obscureText;
  final void Function(String)? onChanged;
  const PropertyTextField({
    super.key,
    this.controller,
    this.label,
    this.sufficIcon,
    this.onChanged,
    // required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadiusDirectional.circular(12.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          // obscureText: obscureText,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(fontSize: 15, color: Color(0xffafafaf)),
            border: InputBorder.none,
            fillColor: Theme.of(context).colorScheme.onTertiary,
            filled: true,
            suffixIcon: sufficIcon,
          ),
        ),
      ),
    );
  }
}
