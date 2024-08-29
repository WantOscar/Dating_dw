import 'package:dating/data/repository/member_block_respository.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:get/get.dart';

class MemberBlockController {
  final MemberBlockRespository memberBlockRespository;

  MemberBlockController({required this.memberBlockRespository});

  static MemberBlockController get to => Get.find();

  Future<void> memberBlock(int id) async {
    try {
      await memberBlockRespository.postMemberBlock(id);
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to block user: $e');
    }
  }
}
