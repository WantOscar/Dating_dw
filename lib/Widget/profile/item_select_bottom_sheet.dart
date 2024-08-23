import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 캠밋에서 아이템을 고를 때 사용하는
/// 커스텀 피커 다이얼로그 위젯
class ItemSelectBottomSheet extends StatelessWidget {
  final void Function(int value)? onSelectedItemChanged;
  final void Function()? onDone;
  final List<String> items;
  const ItemSelectBottomSheet(
      {super.key,
      this.onSelectedItemChanged,
      required this.items,
      this.onDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40.0,
                onSelectedItemChanged: onSelectedItemChanged,
                children: items
                    .map((year) => GestureDetector(
                          onTap: onDone,
                          child: Text(
                            year,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ))
                    .toList(),
              ),
            ),
            GestureDetector(
              onTap: onDone,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "선택",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
