import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final void Function()? onTap;
  const Avatar({super.key, this.onTap});

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
              child: Image.network(
                'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '카리나',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const Text(
          '20세',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        )
      ],
    );
  }
}
