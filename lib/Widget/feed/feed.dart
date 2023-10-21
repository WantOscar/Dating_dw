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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: ClipRRect(
            child: Image.network(
              'https://i.namu.wiki/i/kaz6S7cPB4_I17_j-3wqJiwE89xPTzrC8QPSZpon-r6yknLvtmO6WF0j0thUrddEEEakudNFvpXm-aVrFvSE-xh0jmuh61xeLO7J_2sTSpqGWvSNNyJRR0dA28cN_Kdz536msgVDrzpwfLZiqA-PqA.webp',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
            ),
          ),
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
