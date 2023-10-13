import 'package:dating/Widget/feed/feed_icon.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FeedIcon(),
              Icon(Icons.more_horiz),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          color: Colors.grey,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '하늘이 짱 맑다 어쩌고 저쩌고 ',
                  ),
                  Text(
                    '#하늘 #짱맑다 #과팅',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.blue,
                      ),
                      Text('12'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.pink,
                      ),
                      Text('62'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        color: Colors.green,
                      ),
                      Text('7')
                    ],
                  ),
                  Row(
                    children: [
                      Text('7시간 전'),
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
