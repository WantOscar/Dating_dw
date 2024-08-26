import 'package:dating/data/repository/block_other_user_respository.dart';

class BlockOtherUserService {
  final BlockOtherUserRespository blockOtherUserRespository;

  BlockOtherUserService({required this.blockOtherUserRespository});

  Future<void> postMemberBlock(int id) =>
      blockOtherUserRespository.memberBlock(id);
}
