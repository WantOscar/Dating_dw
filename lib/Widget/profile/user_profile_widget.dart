import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserProfileWidget extends StatefulWidget {
  final User user;
  const UserProfileWidget({super.key, required this.user});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  int _index = 0;

  changeIndex(int index, CarouselPageChangedReason reason) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 내 프로필 사진들
        _profileImages(),

        /// 본인 인적사항 정보
        Positioned(
          left: 33,
          bottom: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userName(),
              _ageAndHeight(),
              _address(),
              _introduce(),
            ],
          ),
        ),

        Positioned(right: 1, left: 1, bottom: 10, child: _options()),
      ],
    );
  }

  /// 사용자의 프로필 이미지를 보여주는 슬라이더 위젯
  Widget _profileImages() => CarouselSlider.builder(
        itemCount: widget.user.images!.length,
        itemBuilder: (context, index, realIndex) {
          return AspectRatio(
              aspectRatio: 1.1,
              child: Container(
                color: Colors.grey,
                child: CachedNetworkImage(
                  imageUrl: widget.user.images![index],
                ),
              ));
        },
        options: CarouselOptions(
          enableInfiniteScroll: false,
          aspectRatio: 1,
          viewportFraction: 1,
          onPageChanged: changeIndex,
        ),
      );

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSmoothIndicator(
          activeIndex: _index,
          count: widget.user.images!.length,
          effect: ScrollingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: ThemeColor.fontColor,
            activeDotScale: 1,
            spacing: 4.0,
            dotWidth: 10.0,
            dotHeight: 10.0,
          ),
        ),
      ],
    );
  }

  Widget _userName() => Text(
        widget.user.nickName!,
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _ageAndHeight() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "${widget.user.age!.toString()}세",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              "${widget.user.height!}cm",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );

  Widget _address() => Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: IconShape.iconLocationOn,
          ),
          Text(
            widget.user.address!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );

  Widget _introduce() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: IconShape.iconMessasge,
          ),
          Text(
            widget.user.description!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
}
