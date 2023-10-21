import 'package:flutter/material.dart';

class ContainerBasic extends StatelessWidget {
  const ContainerBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.width * 0.33,
      child: ClipRRect(
        child: Image.network(
          'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
