// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PunchDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PunchDTO _$PunchDTOFromJson(Map<String, dynamic> json) {
  return PunchDTO(
    date: json['date'],
    employerCode: json['employerCode'],
    pin: json['pin'],
    photoContent: json['photoContent'],
    deviceId: json['deviceId'],
    version: json['version'],
    platform: json['platform'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    locale: json['locale'],
    origin: json['origin'],
    autoTimeDisabled: json['autoTimeDisabled'],
    offline: json['offline'],
    gpsDisable: json['gpsDisable'],
    airPlaneModeEnable: json['airPlaneModeEnable'],
    kioskMode: json['kioskMode'],
    mockLocationEnabled: json['mockLocationEnabled'],
    validTimezone: json['validTimezone'],
    timezoneId: json['timezoneId'],
    type: json['type'],
    attachments: json['attachments'],
    live: json['live'],
    edited: json['edited'],
  );
}

Map<String, dynamic> _$PunchDTOToJson(PunchDTO instance) => <String, dynamic>{
      'date': instance.date,
      'employerCode': instance.employerCode,
      'pin': instance.pin,
      'photoContent': instance.photoContent,
      'deviceId': instance.deviceId,
      'version': instance.version,
      'platform': instance.platform,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locale': instance.locale,
      'origin': instance.origin,
      'autoTimeDisabled': instance.autoTimeDisabled,
      'offline': instance.offline,
      'gpsDisable': instance.gpsDisable,
      'airPlaneModeEnable': instance.airPlaneModeEnable,
      'kioskMode': instance.kioskMode,
      'mockLocationEnabled': instance.mockLocationEnabled,
      'validTimezone': instance.validTimezone,
      'timezoneId': instance.timezoneId,
      'type': _$PunchTypeEnumMap[instance.type],
      'attachments': instance.attachments,
      'live': instance.live,
      'edited': instance.edited,
    };

const _$PunchTypeEnumMap = {
  PunchType.MOBILE: 'MOBILE',
};
