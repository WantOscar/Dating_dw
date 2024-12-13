import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';

class FeedWriteScreen extends StatefulWidget {
  final Feed? feed;

  const FeedWriteScreen({super.key, this.feed});

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
    _titleController = TextEditingController(text: widget.feed?.title ?? '');
    _contentController =
        TextEditingController(text: widget.feed?.content ?? '');
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
            title: (widget.feed == null) ? "글 쓰기" : "글 수정",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 33.0, right: 33.0, top: 30, bottom: 10),
                child: Text(
                  '제목',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              _titleWrite(),
              const Padding(
                padding: EdgeInsets.only(
                    left: 33.0, right: 33.0, top: 30, bottom: 10),
                child: Text(
                  '당신의 이야기를 공유해보세요',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              _sub(),
            ],
          ),
        ),
        bottomSheet: _completeButton());
  }

  /// 제목 쓰기 칸(title)
  Widget _titleWrite() {
    return Padding(
      padding: const EdgeInsets.only(left: 33.0, right: 33.0, bottom: 10),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 12),
          child: TextField(
            controller: _titleController,
            maxLength: 20,
            maxLines: 1,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: '제목을 작성해주세요.',
              hintStyle: TextStyle(fontSize: 15.0),
              isDense: true,
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: FeedController.to.titleChange,
            textInputAction: TextInputAction.done,
            scrollPhysics: const BouncingScrollPhysics(),
            scrollPadding: const EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }

  /// 세부 글 작성 칸(sub)
  Widget _sub() {
    return Padding(
      padding: const EdgeInsets.only(left: 33.0, right: 33.0, bottom: 10),
      child: Container(
        height: 298,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 12.0),
          child: TextField(
            textAlignVertical: const TextAlignVertical(y: -1),
            controller: _contentController,
            maxLength: 255,
            expands: true,
            maxLines: null,
            minLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: '글을 작성해주세요.',
              hintStyle: TextStyle(fontSize: 15.0),
              isDense: true,
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: FeedController.to.contentChange,
          ),
        ),
      ),
    );
  }

  /// 처음 글 작성을 완료한 후,
  /// 이 버튼을 누르면 탐색 창에서 작성한 글이 올라감.
  Widget _completeButton() {
    return SafeArea(
      bottom: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 33.0, vertical: 35.0),
              child: SafeArea(
                bottom: true,
                child: BottomButton(
                  onTap: () {
                    if (widget.feed != null) {
                      Feed updatedFeed = Feed(
                          id: widget.feed!.id,
                          title: _titleController.text,
                          content: _contentController.text);
                      FeedController.to.updateDialog(updatedFeed);
                    } else {
                      FeedController.to.completeFeed();
                    }
                  },
                  color: ThemeColor.fontColor,
                  child: const Text(
                    "작성 완료",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: Theme.of(context).colorScheme.tertiary,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  '개인정보 및 SNS 계정 공유, 커뮤니티에 맞지 않는 부적절한 콘텐츠의 경우 검열 및 제재 될 수 있음을 알려드립니다.',
                  style: TextStyle(
                    fontSize: 10,
                    color: ThemeColor.fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
