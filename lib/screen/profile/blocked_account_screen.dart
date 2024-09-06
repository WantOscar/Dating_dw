<<<<<<< HEAD
import 'package:dating/widget/common/icon_header.dart';
=======
import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/Widget/setting_profile/member_block_avatar.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/utils/enums.dart';
>>>>>>> 843e625526ba218337929b556bb709f475ab9667
import 'package:flutter/material.dart';

class BlockedAccountScreen extends GetView<MemberBlockController> {
  const BlockedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconHeader(text: '차단된 계정'),
      body: Obx(() => (controller.isLoading == Status.loading)
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : (controller.blockedUsers.isEmpty)
              ? const Center(
                  child: Text("차단된 사용자가 없습니다!"),
                )
              : ListView.builder(
                  itemCount: controller.blockedUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.blockedUsers[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MemberBlockAvatar(
                        user: user,
                      ),
                    );
                  },
                )),
    );
  }
}
