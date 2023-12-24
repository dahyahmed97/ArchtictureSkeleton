import 'package:archtictureskeletonsample/core/dataSource/data_source.dart';
import 'package:archtictureskeletonsample/core/error/failures.dart';
import 'package:archtictureskeletonsample/core/network/network_info.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpAllVacations/get_emp_all_vacation_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpAllVacations/get_emp_all_vacations_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getVacationTypes/get_vacation_types_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

import 'base_repo.dart';

class Repository extends BaseRepository implements IRepository {
 late IDataSource dataSource;

  Repository(IDataSource appDataSource) : super(NetworkInfo(con: DataConnectionChecker())){
    dataSource=appDataSource;
  }

  @override
  Future<Either<Failure, LoginResponseModel>> performLogin(LoginRequestModel loginRequestModel) {
   return handleException(() => dataSource.performLogin(loginRequestModel));
  }

  @override
  Future<Either<Failure, GetEmpVacationTypesResponseModel>> getEmpVacationTypes(GetEmpVacationTypesRequestModel getEmpVacationTypesRequestModel) {
   return handleException(() => dataSource.getEmpVacationTypes(getEmpVacationTypesRequestModel));
  }

  @override
  Future<Either<Failure, GetVacationTypesResponseModel>> getVacationTypes() {
   return handleException(() => dataSource.getVacationTypes());
  }

  @override
  Future<Either<Failure, GetEmpAllVacationsResponseModel>> getEmpAllVacations(GetEmpAllVacationsRequestModel getEmpAllVacationsRequestModel) {
   return handleException(() => dataSource.getEmpAllVacations(getEmpAllVacationsRequestModel));
  }


 
}