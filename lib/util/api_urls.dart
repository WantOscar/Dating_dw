class ApiUrl {
  static String get login =>
      'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/login';
  static String get memberJoin =>
      'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/join';
  static String get messages => 'http://your-server-url/api/chat/messages';
  static String get sendMessages =>
      'http://your-server-url/api/chat/messages/sendMessage';
  static String get profile =>
      'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/profile';
  static String get profileUpdate =>
      'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/profile/update';
  static String get meetingRoom =>
      'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/gwating/create';
}
