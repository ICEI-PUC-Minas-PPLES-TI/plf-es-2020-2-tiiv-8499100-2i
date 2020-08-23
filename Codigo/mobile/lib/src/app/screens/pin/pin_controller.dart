import 'package:inteligenciaindustrialapp/src/app/models/dto/employee/EmployeeDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/services/employee_service.dart';
import 'package:inteligenciaindustrialapp/src/app/services/service_status_data.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:mobx/mobx.dart';

part 'pin_controller.g.dart';

class PinController = _PinControllerBase with _$PinController;

abstract class _PinControllerBase with Store {
  final _employeeService = EmployeeService();

  ServiceStatusData<EmployeeDTO> employee = ServiceStatusData();

  @action
  Future<bool> getEmployee(String pin) {
    employee.setPending();
    return this
        ._employeeService
        .getEmployee(code: frwkEmployer.employer.getData.code, pin: pin)
        .then((response) {
      employee.setDone(response);
      return true;
    }).catchError((error) {
      employee.setError(error);
      return false;
    });
  }
}
