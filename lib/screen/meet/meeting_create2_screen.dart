import 'package:dating/Widget/bottom_apply_bar.dart';
import 'package:dating/Widget/meet/meet_create2/location_select.dart';
import 'package:dating/Widget/meet/meet_create2/set_num_female.dart';
import 'package:dating/Widget/meet/meet_create2/set_num_male.dart';
import 'package:dating/screen/meet/meeting_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingCreate2Screen extends StatefulWidget {
  const MeetingCreate2Screen({super.key});

  @override
  State<MeetingCreate2Screen> createState() => _MeetingCreate2ScreenState();
}

class _MeetingCreate2ScreenState extends State<MeetingCreate2Screen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: IconShape.iconArrowBack,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: const Text(
          '방 설정',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // meeting room photo upload
              const Text(
                '과팅방 사진',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: width * 0.9,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    color: inputColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      width: width * 0.15,
                      height: width * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: IconShape.iconPhotoCamera,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // meeting room title
              const Text(
                '방 제목',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLength: 15,
                style: const TextStyle(
                  decorationThickness: 0,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: inputColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: '제목은 최대 15자로 제한',
                ),
              ),
              const SizedBox(height: 20),

              // meeting room explain
              const Text(
                '방 설명',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 50,
                maxLines: 5,
                style: const TextStyle(
                  decorationThickness: 0,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: inputColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: '방 설명은 최대 50자로 제한',
                ),
              ),
              const SizedBox(height: 20),

              // location select
              const LocationSelect(),
              const SizedBox(height: 20),

              // set number of people
              const Text(
                '남/여 인원 설정',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SetNumMale(),
                  SizedBox(width: 10),
                  SetNumFemale(),
                ],
              ),
              const SizedBox(height: 20),

              // invite friends
              const Text(
                '초대하기',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: width * 0.9,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                    color: inputColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          '초대하기',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomApplyBar(
        heightPoint: 0.06,
        text: '확인',
        onTap: () {
          Get.to(const MeetingScreen());
        },
      ),
    );
  }
}
