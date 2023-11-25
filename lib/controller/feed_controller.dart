import 'package:get/get.dart';

class Feed {
  final String feedImage;
  final String content;

  Feed({required this.feedImage, required this.content});
}

class FeedController extends GetxController {
  final List<Feed> feedList = <Feed>[].obs;

  // 피드를 추가하는 함수
  void addFeed(String feedImage, String content) {
    final feed = Feed(feedImage: feedImage, content: content);
    feedList.add(feed);
  }

  // 피드를 삭제하는 함수
  void deleteFeed(int index) {
    if (index >= 0 && index < feedList.length) {
      feedList.removeAt(index);
    }
  }
}

class FeedView {
  final int id;
  final String name;
  final String residence;
  final int age;
  final int height;
  final String profileImage;
  final String feedImage;
  final String content;
  final String hashTag;
  final int commentCnt;
  final int likeCnt;
  final int bookmarkCnt;
  final String updateAt;

  FeedView(
      {required this.id,
      required this.name,
      required this.residence,
      required this.age,
      required this.height,
      required this.profileImage,
      required this.feedImage,
      required this.content,
      required this.hashTag,
      required this.commentCnt,
      required this.likeCnt,
      required this.bookmarkCnt,
      required this.updateAt});
}

class FeedViewController extends GetxController {
  final RxList<FeedView> feedViewList = <FeedView>[].obs;

  // 피드 추가 함수
  void addFeed(FeedView feed) {
    feedViewList.add(feed);
  }

  // 피드 초기화 함수
  void clearFeed() {
    feedViewList.clear();
  }
}
