import 'package:dating/data/repository/setting_password.repository.dart';

class SettingPasswordService {
  final SettingPasswordRepository settingPasswordRepository;

  SettingPasswordService({required this.settingPasswordRepository});

  Future<String> postSettingPassword(Map<String, dynamic> data) =>
      settingPasswordRepository.postSettingPassword(data);
}
