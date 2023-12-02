import 'package:dating/data/model/mbti.dart';

class MbtiRepository {
  // RoomFetch service;
  // MbtiRepository ({required this.service});
  // Dio dio = Dio();

  Future<List<Mbti>> getListMbtiData() async {
    final resp = [
      {
        'name': '정운',
        'mbti': 'ENFP',
      },
      {
        'name': '동욱',
        'mbti': 'ESTP',
      },
    ];
    List<Mbti> mbtis = [];
    for (var data in resp) {
      final mbti = Mbti.fromJson(data);
      mbtis.add(mbti);
    }
    return mbtis;
  }
  // getListMbtiData() => service.getListMbtiData();
}
