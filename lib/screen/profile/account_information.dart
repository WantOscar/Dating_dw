import 'package:dating/Widget/icon_header.dart';
import 'package:flutter/material.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: IconHeader(text: '계정 확인 및 비밀번호 변경'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text('연동된 계정'),
          ),
        ],
      ),
    );
  }
}
