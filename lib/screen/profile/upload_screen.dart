import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '사진 업로드',
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconShape.iconArrowGoto,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        _preview(),
        _header(),
        _images(),
      ],
    );
  }

  /// 선택한 사진 확인하는 영역
  Widget _preview() {
    return SliverToBoxAdapter(
      child: Container(
        height: Get.size.width * 1.1,
        width: Get.size.width,
        color: Colors.black,
      ),
    );
  }

  /// 앨범 선택 버튼 영역, 다양한 옵션 버튼들
  Widget _header() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '최근',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.image_search),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.photo_camera),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _images() {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
      ),
    );
  }
}
