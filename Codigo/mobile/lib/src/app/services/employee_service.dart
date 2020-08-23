import 'package:flutter/material.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/employee/EmployeeDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class EmployeeService extends BaseService {
  Future<EmployeeDTO> getEmployee(
      {@required String code, @required String pin}) {
    Map<String, String> headers = {'Authorization': 'klasjdklajd'};

    return this
        .request(HttpMethod.GET, 'employers/$code/employees/$pin',
            headers: headers)
        .then((response) {
      if (response == null) return null;
      return EmployeeDTO.map(response);
    }).catchError((error) {
      throw (error);
    });
  }
}
