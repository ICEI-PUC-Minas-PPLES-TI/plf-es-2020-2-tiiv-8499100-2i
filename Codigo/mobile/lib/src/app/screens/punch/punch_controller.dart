import 'package:inteligenciaindustrialapp/src/app/models/dto/punch/PunchDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/punch/PunchResponseDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/services/punch_service.dart';
import 'package:inteligenciaindustrialapp/src/app/services/service_status_data.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'punch_controller.g.dart';

class PunchController = _PunchControllerBase with _$PunchController;

abstract class _PunchControllerBase with Store {
  final _punchService = PunchService();

  ServiceStatusData<PunchResponseDTO> punchResponse = ServiceStatusData();

  @action
  Future<bool> registerPunch() {
    punchResponse.setPending();

    PunchDTO punchDTO = PunchDTO();
    punchDTO.date = DateFormat("dd/MM/yyyy HH:mm:ss").format(DateTime.now());
    punchDTO.employerCode = frwkEmployer.employer?.getData?.code;
    punchDTO.pin = frwkPin.employee?.getData?.pin;
    //punchDTO.photoContent = base64Image;

    List<PunchDTO> punches = List();
    punches.add(punchDTO);

    return this._punchService.registerPunch(punches: punches).then((response) {
      punchResponse.setDone(response);
      return true;
    }).catchError((error) {
      punchResponse.setError(error);
      return false;
    });
  }
}
