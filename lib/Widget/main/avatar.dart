import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/data/model/user.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final void Function()? onTap;
  final User user;
  const Avatar({super.key, this.onTap, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                imageUrl: user.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user.nickName!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Text(
          '${user.age}세',
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        )
      ],
    );
  }
}
