import 'ShiftScheduleDTO.dart';

class DayScheduleDTO {
  DiaEnum dayOfWeek;
  String startMainInterval;
  String endMainInterval;
  List<ShiftScheduleDTO> shifts;

  DayScheduleDTO.map(Map<String, dynamic> json) {
    this.dayOfWeek = json["dayOfWeek"];
    this.startMainInterval = json["startMainInterval"];
    this.endMainInterval = json["endMainInterval"];

    var list = json["shifts"] as List;
    this.shifts = list.map((val) => ShiftScheduleDTO.map(val)).toList();
  }
}

enum DiaEnum { DOMINGO, SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO }
