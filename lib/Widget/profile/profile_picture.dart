import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 1.1,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: Colors.red,
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
            // borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
