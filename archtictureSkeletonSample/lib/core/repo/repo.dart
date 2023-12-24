import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../features/auth/login/models/login_response_model.dart';
import '../../features/home/models/getEmpAllVacations/get_emp_all_vacation_request_model.dart';
import '../../features/home/models/getEmpAllVacations/get_emp_all_vacations_response_model.dart';
import '../../features/home/models/getEmpVacationTypes/get_emp_vacation_types_request_model.dart';
import '../../features/home/models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import '../../features/home/models/getVacationTypes/get_vacation_types_response_model.dart';
import '../error/failures.dart';

abstract class IRepository {
  Future<Either<Failure,LoginResponseModel>> performLogin(
      LoginRequestModel loginRequestModel);

  Future<Either<Failure,GetEmpVacationTypesResponseModel>> getEmpVacationTypes(
      GetEmpVacationTypesRequestModel getEmpVacationTypesRequestModel);

  Future<Either<Failure,GetVacationTypesResponseModel>> getVacationTypes();

  Future<Either<Failure,GetEmpAllVacationsResponseModel>> getEmpAllVacations(
      GetEmpAllVacationsRequestModel getEmpAllVacationsRequestModel);
}