import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarningWindow extends StatelessWidget {
  const WarningWindow({
    super.key,
    required this.onTap,
    required this.titleText,
    required this.explainText,
    required this.btnText,
  });
  final void Function()? onTap;
  final String titleText;
  final String explainText;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),

      /// title(ex. 로그아웃)
      title: Text(titleText),

      /// explain(ex. 정말로 로그아웃 하시나요 ?)
      content: Text(explainText),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: width * 0.8,
                height: width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    /// 실행 버튼 텍스트(ex. 로그아웃)
                    btnText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: width * 0.8,
                height: width * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ThemeColor.inputColor),
                child: const Center(
                  child: Text(
                    '취소',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
