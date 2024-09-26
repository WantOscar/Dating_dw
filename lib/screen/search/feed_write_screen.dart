import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteScreen extends StatefulWidget {
  final Feed? feed;
  final String? title;
  final String? content;
  final bool? isEdit;
  const FeedWriteScreen(
      {super.key, this.feed, this.title, this.content, this.isEdit});

  @override
  State<FeedWriteScreen> createState() => _FeedWriteScreenState();
}

class _FeedWriteScreenState extends State<FeedWriteScreen> {
  late final FeedController controller;
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    controller = FeedController.to;
    _titleController = TextEditingController(text: widget.title ?? '');
    _contentController = TextEditingController(text: widget.content ?? '');
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
          backAction: FeedController.to.cancel,
          title: (widget.isEdit != true) ? "글 쓰기" : "글 수정",
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
      bottomSheet: _completeButton(widget.feed!),
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
              onChanged: FeedController.to.titleChange,
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
              onChanged: FeedController.to.contentChange,
            ),
          ),
        ),
      ),
    );
  }

  /// 처음 글 작성을 완료한 후,
  /// 이 버튼을 누르면 탐색 창에서 작성한 글이 올라감.
  Widget _completeButton(Feed feed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: BottomButton(
        onTap: () {
          // if (widget.isEdit == true) {
          //   FeedController.to.updateDialog(feed);
          // } else {
          //   FeedController.to.completeFeed();
          // }
          if (widget.isEdit == true) {
            Feed updatedFeed = Feed(
                id: feed.id,
                title: _titleController.text,
                content: _contentController.text);
            FeedController.to.updateDialog(updatedFeed);
          } else {
            FeedController.to.completeFeed();
          }
        },
        child: const Text(
          "작성 완료",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
