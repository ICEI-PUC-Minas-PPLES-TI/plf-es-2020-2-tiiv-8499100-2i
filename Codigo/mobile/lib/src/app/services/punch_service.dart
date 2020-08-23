import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/punch/PunchDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/punch/PunchResponseDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class PunchService extends BaseService {
  Future<PunchResponseDTO> registerPunch({@required List<PunchDTO> punches}) {
    Map<String, String> headers = {'Authorization': 'klasjdklajd'};

    List jsonList = punches.map((punch) => punch.toJson()).toList();

    return this
        .request(HttpMethod.POST, 'punches',
            headers: headers, body: json.encode(jsonList))
        .then((response) {
      if (response == null) return null;
      return PunchResponseDTO.map(response);
    }).catchError((error) {
      throw (error);
    });
  }
}
