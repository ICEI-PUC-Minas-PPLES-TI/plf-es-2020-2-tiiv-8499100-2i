import 'package:dio/dio.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class CalculatorService extends BaseService {
  sendStatistic({String type}) {
    FormData data = FormData.fromMap({
      'uid': userController.user.getData?.uid,
      'calculator_type': type,
    });

    this.request(HttpMethod.POST, 'calculator_view',
        headers: headers, body: data);
  }
}
