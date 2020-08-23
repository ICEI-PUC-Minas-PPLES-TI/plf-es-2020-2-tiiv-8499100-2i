import 'DayScheduleDTO.dart';

class ScheduleDTO {
  List<DayScheduleDTO> days;
  bool cyclic;

  ScheduleDTO.map(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }

    this.cyclic = json["cyclic"];

    var list = json["days"] as List;
    this.days = list.map((val) => DayScheduleDTO.map(val)).toList();
  }
}
