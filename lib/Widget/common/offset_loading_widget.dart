import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OffsetLoadingWidget extends StatelessWidget {
  const OffsetLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.4),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.dotsTriangle(
                  color: ThemeColor.fontColor, size: 50)
            ],
          ),
        )
      ],
    );
  }
}
