import 'package:dating/Widget/profile_picture.dart';
import 'package:dating/constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '프로필',
            style: TextStyle(
                fontSize: 25, color: fontColor, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePicture(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '홍박사',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('소개 글'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('안녕하세요. 잘부탁드려요!'),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('내 성격'),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.1,
                          // height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('ESTP'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.1,
                          // height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('친절함'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
