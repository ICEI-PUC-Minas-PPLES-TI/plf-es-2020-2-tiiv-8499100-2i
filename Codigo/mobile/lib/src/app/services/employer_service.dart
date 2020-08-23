import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/EmployerDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class EmployerService extends BaseService {
  Future<EmployerDTO> getEmployer({@required String code}) {
    Map<String, String> headers = {'Authorization': 'klasjdklajd'};

    return this
        .request(HttpMethod.GET, 'employers/$code', headers: headers)
        .then((response) {
      if (response == null) return null;
      return EmployerDTO.map(response);
    }).catchError((error) {
      throw (error);
    });
  }
}
