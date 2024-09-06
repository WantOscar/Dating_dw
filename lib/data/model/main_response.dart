
class MainResponse {
  final int notCheckAlert;
  final List<Map<String, dynamic>> sendHeartList;
  final List<Map<String, dynamic>> receiverHeartList;
  final List<Map<String, dynamic>> randomMemberList;

  MainResponse({
    required this.notCheckAlert,
    required this.sendHeartList,
    required this.receiverHeartList,
    required this.randomMemberList,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
        notCheckAlert: json["notCheckAlert"],
        sendHeartList:
            (json["sendHeartList"].isNotEmpty) ? json["sendHeartList"] : [],
        receiverHeartList: (json["receiverHeartList"].isNotEmpty)
            ? json["receiverHeartList"]
            : [],
        randomMemberList: (json["randomMemberList"].isNotEmpty)
            ? json["randomMemberList"]
            : []);
  }
}
