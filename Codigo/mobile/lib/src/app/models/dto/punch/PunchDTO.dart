import 'package:inteligenciaindustrialapp/src/app/models/dto/punch/AttachmentDTO.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PunchDTO.g.dart';

enum PunchType { MOBILE }

@JsonSerializable()
class PunchDTO {
  String date;
  String employerCode;
  String pin;
  String photoContent;
  String deviceId;
  String version;
  String platform = "android";
  num latitude;
  num longitude;
  String locale;
  String origin;
  bool autoTimeDisabled = false;
  bool offline = false;
  bool gpsDisable = false;
  bool airPlaneModeEnable;
  bool kioskMode = false;
  bool mockLocationEnabled;
  bool validTimezone = true;
  String timezoneId;
  PunchType type = PunchType.MOBILE;
  List<AttachmentDTO> attachments = List();
  bool live = false;
  bool edited = false;

  PunchDTO(
      {date,
      employerCode,
      pin,
      photoContent,
      deviceId,
      version,
      platform,
      latitude,
      longitude,
      locale,
      origin,
      autoTimeDisabled,
      offline,
      gpsDisable,
      airPlaneModeEnable,
      kioskMode,
      mockLocationEnabled,
      validTimezone,
      timezoneId,
      type,
      attachments,
      live,
      edited});

  factory PunchDTO.fromJson(Map<String, dynamic> json) =>
      _$PunchDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PunchDTOToJson(this);
}
