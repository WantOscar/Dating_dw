import 'package:dating/Widget/meet/meeting_room.dart';
import 'package:dating/Widget/meet/select_room.dart';
import 'package:dating/data/model/meeting_room.dart';
import 'package:dating/data/repository/room_repository.dart';
import 'package:dating/screen/meet/meeting_create1_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            '오늘의 과팅❤️‍🔥',
            style: TextStyle(
                fontSize: 20, color: fontColor, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.tune,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: RoomRepository().getMeetingRoomData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            List<MeetingRoom> meetingRooms = snapshot.data!;
            const int index = 0;
            final meetingRoom = meetingRooms[index];
            return SingleChildScrollView(
              child: Column(
                children: [
                  // select college student or general
                  const SelectRoom(),
                  const SizedBox(height: 20),

                  // meeting room
                  Meeting(
                    meetingRoom: meetingRoom,
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const MeetingCreate1Screen());
        },
        backgroundColor: fontColor,
        child: IconShape.iconAdd,
      ),
    );
  }
}
