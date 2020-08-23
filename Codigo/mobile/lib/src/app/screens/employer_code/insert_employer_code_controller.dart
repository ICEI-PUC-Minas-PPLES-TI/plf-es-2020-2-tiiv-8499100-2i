import 'package:inteligenciaindustrialapp/src/app/models/dto/EmployerDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/screens/pin/pin_screen.dart';
import 'package:inteligenciaindustrialapp/src/app/services/employer_service.dart';
import 'package:inteligenciaindustrialapp/src/app/services/service_status_data.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:mobx/mobx.dart';

part 'insert_employer_code_controller.g.dart';

class InsertEmployerCodeController = _InsertEmployerCodeControllerBase
    with _$InsertEmployerCodeController;

abstract class _InsertEmployerCodeControllerBase with Store {
  final _employerService = EmployerService();

  ServiceStatusData<EmployerDTO> employer = ServiceStatusData();

  @action
  getEmployer(String employerCode) {
    if (employerCode == null || employerCode.isEmpty) {
      return;
    }

    this.employer.setPending();
    this._employerService.getEmployer(code: employerCode).then((response) {
      this.employer.setDone(response);
      frwkNavigator.navigate(PinScreen(), modal: true, replace: true);
    }).catchError((error) {
      this.employer.setError(error);
    });
  }
}
