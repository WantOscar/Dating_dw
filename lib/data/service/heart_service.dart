import 'package:dating/data/repository/heart_repository.dart';

class HeartService {
  final HeartRepository heartRepository;

  HeartService({
    required this.heartRepository,
  });

  Future<void> postHeart(int id) => heartRepository.heartAdd(id);
}
