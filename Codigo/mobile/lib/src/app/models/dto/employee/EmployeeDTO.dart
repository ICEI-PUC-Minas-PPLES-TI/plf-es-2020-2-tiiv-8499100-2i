import 'ConfigRulesDTO.dart';
import 'ProRulesDTO.dart';
import 'PunchRulesDTO.dart';
import 'ScheduleDTO.dart';

class EmployeeDTO {
  num id;
  String name;
  String email;
  String photoUrl;
  String pin;
  String position;
  bool pro;
  bool fired;
  ScheduleDTO schedule;
  PunchRulesDTO punchRules;
  ProRulesDTO proRules;
  ConfigRulesDTO configRules;

  EmployeeDTO.map(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
    this.photoUrl = json["photoUrl"];
    this.pin = json["pin"];
    this.position = json["position"];
    this.pro = json["pro"];
    this.fired = json["fired"];
    this.schedule =
        json["schedule"] != null ? ScheduleDTO.map(json["schedule"]) : null;
    this.punchRules = PunchRulesDTO.map(json["punchRules"]);
    this.proRules = ProRulesDTO.map(json["proRules"]);
    this.configRules = ConfigRulesDTO.map(json["configRules"]);
  }
}
