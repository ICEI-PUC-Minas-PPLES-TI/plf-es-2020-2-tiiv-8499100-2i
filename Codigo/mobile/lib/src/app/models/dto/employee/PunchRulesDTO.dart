class PunchRulesDTO {
  bool canRegisterPunch;
  bool photoRequired;
  bool onlineOnly;
  bool qrCode;
  bool horasInItinere;
  bool onlineFacialRecognition;
  bool routeRequired;
  bool canRegisterPunchManually;
  bool photoRequiredLatePunch;

  PunchRulesDTO.map(Map<String, dynamic> json) {
    this.canRegisterPunch = json["canRegisterPunch"];
    this.photoRequired = json["photoRequired"];
    this.onlineOnly = json["onlineOnly"];
    this.qrCode = json["qrCode"];
    this.horasInItinere = json["horasInItinere"];
    this.onlineFacialRecognition = json["onlineFacialRecognition"];
    this.routeRequired = json["routeRequired"];
    this.canRegisterPunchManually = json["canRegisterPunchManually"];
    this.photoRequiredLatePunch = json["photoRequiredLatePunch"];
  }
}
