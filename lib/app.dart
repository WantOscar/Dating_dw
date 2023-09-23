import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/gesture_box.dart';
import 'package:dating/Widget/profile_photo.dart';
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Text(
          '캠밋',
          style: TextStyle(
              color: Colors.pink, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.alarm,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: List.generate(
          //       50,
          //       (index) => const ProfilePhoto(),
          //     ),
          //   ),
          // ),
          CarouselSlider.builder(
              itemCount: 50,
              itemBuilder: (context, index, realIndex) => const ProfilePhoto(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 1.3,
                  autoPlay: true,
                  viewportFraction: 0.8)),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '오늘의 과팅🔥',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '정보 수정',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                50,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureBox(),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '과팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person_off), label: '피드'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: '프로필'),
        ],
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIdx,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
