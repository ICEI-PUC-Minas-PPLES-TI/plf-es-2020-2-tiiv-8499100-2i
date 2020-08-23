class ShiftScheduleDTO {
  String start;
  String end;
  String expectedHours;

  ShiftScheduleDTO.map(Map<String, dynamic> json) {
    this.start = json["start"];
    this.end = json["end"];
    this.expectedHours = json["expectedHours"];
  }
}
