import 'package:dating/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: '사용자 이름'),
              onChanged: (value) {
                authController.user.update((user) {
                  user!.email = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '비밀번호'),
              onChanged: (value) {
                authController.user.update((user) {
                  user!.password = value;
                });
              },
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: authController.isLoading.value
                  ? null
                  : () async {
                      await authController.signUp();
                    },
              child: authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
