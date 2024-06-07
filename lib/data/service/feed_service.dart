import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';

class FeedService {
  final FeedRepository feedRepository;

  FeedService({required this.feedRepository});

  Future<Feed?> getFeed(int id) => feedRepository.getFeed(id);

  Future<List<Feed>?> getAllFeeds() => feedRepository.getAllFeeds();

  Future<Feed?> postFeed(Map<String, dynamic> data) =>
      feedRepository.postFeed(data);
}
