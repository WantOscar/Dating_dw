class SettingPassword {
  String? currentPassword;
  String? newPassword;
  String? checkNewPassword;

  SettingPassword({
    this.currentPassword,
    this.newPassword,
    this.checkNewPassword,
  });

  Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "checkNewPassword": checkNewPassword,
      };
}
