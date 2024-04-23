import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class NotificationWindow extends StatelessWidget {
  final String title;
  final String content;
  final String? confirmLabel;
  final String? cancelLabel;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  const NotificationWindow(
      {super.key,
      required this.content,
      this.onCancel,
      required this.title,
      this.onConfirm,
      this.confirmLabel,
      this.cancelLabel})
      : assert(
            (confirmLabel == null && onConfirm == null) ||
                (confirmLabel != null && onConfirm != null),
            "확인 버튼이 부여되면 반드시 확인 버튼의 콜백함수를 함께 넣어야 합니다!."),
        assert(
            (cancelLabel == null && onCancel == null) ||
                (cancelLabel != null && onCancel != null),
            "취소 버튼이 부여되면 반드시 취소 버튼의 콜백함수를 함께 넣어야 합니다!.");

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _title(),
            _content(),
            _confirmButton(),
            _cancelButton(),
          ],
        ),
      ),
    );
  }

  /// 다이얼로그의 타이틀 위젯
  Widget _title() => Text(
        title,
        style: TextStyle(
            color: ThemeColor.fontColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      );

  /// 다이얼로그의 내용 위젯
  Widget _content() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      );

  /// 다이얼로그의 확인 버튼
  Widget _confirmButton() => (confirmLabel != null)
      ? _basicButton(
          onTap: onConfirm,
          buttonColor: ThemeColor.fontColor,
          label: "확인",
          fontColor: Colors.white)
      : Container();

  /// 다이얼로그의 취소 버튼
  Widget _cancelButton() => (cancelLabel != null)
      ? _basicButton(
          onTap: onCancel,
          buttonColor: const Color(0xffefefef),
          label: "취소",
          fontColor: const Color(0xffafafaf))
      : Container();

  /// 다이얼로그에서 사용하는 확인 및 취소 버튼의 기본 외형
  /// 외부에서 색상과 레이블, 함수만 받아서 랜더링함.
  Widget _basicButton({
    required Color buttonColor,
    required String label,
    required Color fontColor,
    required void Function()? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 15, color: fontColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
}
