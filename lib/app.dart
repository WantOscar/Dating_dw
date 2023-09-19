import 'package:flutter/material.dart';

import 'Widget/story.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recent Stories',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(
            Icons.settings,
            color: Colors.black,
            size: 25,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              '나와 잘 맞는 MBTI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Story(),
              Story(),
              Story(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '홍박사',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '홍박사',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '홍박사',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '오늘의 소개',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.grey),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'home'),
        ],
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.black,
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        currentIndex: pageIdx,
        showSelectedLabels: false,
      ),
    );
  }
}
