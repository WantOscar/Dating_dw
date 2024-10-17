import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final void Function()? onTap;
  const FavoriteButton({super.key, this.onTap})
      : assert(onTap != null, "액션 함수를 지정하세요!");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        width: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: IconShape.iconFavorite,
            ),
          ),
        ),
      ),
    );
  }
}
