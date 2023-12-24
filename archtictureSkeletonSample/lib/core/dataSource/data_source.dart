import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_request_model.dart';

import '../../features/auth/login/models/login_response_model.dart';
import '../../features/home/models/getEmpAllVacations/get_emp_all_vacation_request_model.dart';
import '../../features/home/models/getEmpAllVacations/get_emp_all_vacations_response_model.dart';
import '../../features/home/models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import '../../features/home/models/getVacationTypes/get_vacation_types_response_model.dart';

abstract class IDataSource{
Future<LoginResponseModel> performLogin(LoginRequestModel loginRequestModel);

Future<GetEmpVacationTypesResponseModel> getEmpVacationTypes(
    GetEmpVacationTypesRequestModel getEmpVacationTypesRequestModel);

Future<GetVacationTypesResponseModel> getVacationTypes();

Future<GetEmpAllVacationsResponseModel> getEmpAllVacations(
    GetEmpAllVacationsRequestModel getEmpAllVacationsRequestModel);



}