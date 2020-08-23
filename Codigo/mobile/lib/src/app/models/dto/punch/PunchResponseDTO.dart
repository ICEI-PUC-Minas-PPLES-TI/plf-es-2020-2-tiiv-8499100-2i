class PunchResponseDTO {
  String message;
  bool success;

  PunchResponseDTO.map(Map<String, dynamic> json) {
    this.message = json["message"];
    this.success = json["success"];
  }
}
