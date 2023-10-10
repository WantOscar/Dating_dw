import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              const Text('최근 7일'),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('최근 30일'),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('이전 활동'),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                    AlertWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Alert(),
        TextButton(onPressed: () {}, child: const Text('팔로잉'))
      ],
    );
  }
}

class Alert extends StatelessWidget {
  const Alert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('000님이 좋아요를 누르셨습니다!'),
        ),
      ],
    );
  }
}
