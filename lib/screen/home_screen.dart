import 'package:dating/screen/main_screen.dart';
import 'package:dating/constant.dart';
import 'package:dating/screen/meeting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIdx = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MainScreen(),
    const MeetingScreen(),
    const Text('data2'),
    const Text('data3'),
    const Text('data4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '과팅'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '피드'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: '프로필'),
        ],
        onTap: (idx) {
          setState(() {
            _pageIdx = idx;
          });
        },
        selectedItemColor: fontColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIdx,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_pageIdx)),
    );
  }
}
