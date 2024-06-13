import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/widget/common/bottom_apply_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isTextVisible = false;

  final _validateNewPassword = "비밀번호가 일치하지 않습니다!";
  String _new = "";
  String _checkNew = "";

  late final TextEditingController _currentPassword;
  late final TextEditingController _newPassword;
  late final TextEditingController _checkNewPassword;

  @override
  void initState() {
    super.initState();
    _currentPassword = TextEditingController();
    _newPassword = TextEditingController();
    _checkNewPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _currentPassword.dispose();
    _newPassword.dispose();
    _checkNewPassword.dispose();
  }

  void toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const IconHeader(text: '비밀번호 변경'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentPwTxt(),
              _currentPW(),
              const SizedBox(height: 10),
              _newPwTxt(),
              _checkNewPwTxt(),
              _newPW(),
              const SizedBox(height: 10),
              _checkNewPW(),
              (_new != _checkNew)
                  ? Center(
                      child: Text(
                        _validateNewPassword,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: BottomApplyBar(
          text: '확인',
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }

  /// 현재 비밀번호 입력을 보여주는 text
  Widget _currentPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '현재 비밀번호 입력',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 현재 비밀번호를 입력하는 textfield
  Widget _currentPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: _currentPassword,
        maxLength: 15,
        style: const TextStyle(decorationThickness: 0, fontSize: 15),
        obscureText: !_isTextVisible,
        decoration: InputDecoration(
          counterText: '',
          hintText: '비밀번호 최대 15자 제한',
          suffixIcon: IconButton(
            onPressed: toggleTextVisibility,
            icon:
                Icon(_isTextVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  /// 변경할 비밀번호 입력을 보여주는 txt
  Widget _newPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '변경할 비밀번호 입력',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 새로운 비밀번호를 입력하는 textfield
  Widget _newPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: _newPassword,
        maxLength: 15,
        style: const TextStyle(decorationThickness: 0, fontSize: 15),
        obscureText: !_isTextVisible,
        onChanged: (value) {
          setState(() {
            _new = value;
          });
        },
        decoration: InputDecoration(
          counterText: '',
          hintText: '비밀번호 최대 15자 제한',
          suffixIcon: IconButton(
            onPressed: toggleTextVisibility,
            icon:
                Icon(_isTextVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  /// 변경할 비밀번호 확인 입력을 보여주는 txt
  Padding _checkNewPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '변경된 비밀번호 확인',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 새로운 비밀번호 입력 확인을 위한 textfield
  Widget _checkNewPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: _checkNewPassword,
        onChanged: (value) {
          setState(() {
            _checkNew = value;
          });
        },
        maxLength: 15,
        style: const TextStyle(decorationThickness: 0, fontSize: 15),
        obscureText: !_isTextVisible,
        decoration: InputDecoration(
          counterText: '',
          hintText: '비밀번호 최대 15자 제한',
          suffixIcon: IconButton(
            onPressed: toggleTextVisibility,
            icon:
                Icon(_isTextVisible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
