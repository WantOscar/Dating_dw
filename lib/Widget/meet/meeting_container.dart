import 'package:flutter/material.dart';

class MeetingContainer extends StatelessWidget {
  const MeetingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 8))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Image.network(
              'https://images.chosun.com/resizer/AgSU7uA4D8GbK_TyRBjRYKz_wDo=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/UIJUKKZHBBHRZE5AIA2SUXWPUE.gif',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.43,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.45,
              left: MediaQuery.of(context).size.height * 0.02,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF006B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "이태원",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.04,
                child: const Text('이태원에서 같이 술 마셔요',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.08,
              left: MediaQuery.of(context).size.height * 0.02,
              child: Container(
                child: const Row(
                  children: [
                    Text(
                      '성별 무관',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ), // Add some spacing between the texts.
                    Text(
                      '20대',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.height * 0.02,
              child: Container(
                child: const Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 20,
                      color: Colors.blue,
                    ),
                    Text('3/3',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Icon(
                        Icons.people,
                        size: 20,
                        color: Colors.pink,
                      ),
                    ),
                    Text('2/3',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis),
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
