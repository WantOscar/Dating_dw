import 'package:dating/Widget/common/warning_window.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:dating/screen/profile/profile_screen.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteScreen extends StatefulWidget {
  const FeedWriteScreen({super.key});

  @override
  State<FeedWriteScreen> createState() => _FeedWriteScreenState();
}

class _FeedWriteScreenState extends State<FeedWriteScreen> {
  late final FeedController controller;

  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  String _title = "";
  String _content = "";

  @override
  void initState() {
    controller = FeedController.to;
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          showCloseButton: true,
          backAction: cancel,
          title: "글 쓰기",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleWrite(),
            _sub(),
          ],
        ),
      ),
      bottomSheet: _completeButton(),
    );
  }

  /// 제목 쓰기 칸(title)
  Widget _titleWrite() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        strokeWidth: 2,
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [5, 5],
        child: SizedBox(
          height: Get.size.width * 0.15,
          width: Get.size.width * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              maxLength: 50,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: '제목을 작성해주세요.',
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: titleChange,
            ),
          ),
        ),
      ),
    );
  }

  /// 세부 글 작성 칸(sub)
  Widget _sub() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        strokeWidth: 2,
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [5, 5],
        child: Container(
          width: Get.size.width * 1,
          constraints: BoxConstraints(
            minHeight: Get.size.width * 0.15,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              maxLength: 50,
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: '글을 작성해주세요.',
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: contentChange,
            ),
          ),
        ),
      ),
    );
  }

  /// 작성을 완료한 후,
  /// 이 버튼을 누르면 탐색 창에서 작성한 글이 올라감.
  Widget _completeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: BottomButton(
        onTap: writeFeed,
        child: const Text(
          "작성 완료",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// 피드 작성을 취소할건지 물어보고 뒤로 돌아가는 함수
  void cancel() {
    Get.dialog(WarningWindow(
      titleText: '피드 작성 취소',
      explainText: '현재 입력사항을 모두 취소하고 돌아가시겠습니까?',
      onTap: () {
        Get.until((route) => route.isFirst);
      },
      btnText: "작성취소",
    ));
  }

  void writeFeed() {
    final Feed feed = Feed(title: _title, content: _content);

    Get.dialog(WarningWindow(
      titleText: '피드 작성 완료',
      explainText: '작성을 완료하시겠습니까?',
      onTap: () {
        /// 글쓰기 API
        FeedController.to.writeFeed(feed);
        Get.off(() => const HomeScreen());
      },
      btnText: "피드 생성",
    ));
  }

  void titleChange(String value) {
    _title = value;
  }

  void contentChange(String value) {
    _content = value;
  }

  void upDateFeed(
      String value, dynamic titleController, dynamic contentController) async {
    String updatedTitle = titleController.text;
    String updatedContent = contentController.text;
    final Feed feed = Feed(title: updatedTitle, content: updatedContent);

    Get.dialog(WarningWindow(
      titleText: '피드 작성 완료',
      explainText: '작성을 완료하시겠습니까?',
      onTap: () {
        FeedController.to.updateFeed(feed);
        Get.off(() => const ProfileScreen());
      },
      btnText: "피드 생성",
    ));
  }
}
