import 'package:archtictureskeletonsample/core/dataSource/data_source.dart';
import 'package:archtictureskeletonsample/core/utils/endpoints.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpAllVacations/get_emp_all_vacation_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpAllVacations/get_emp_all_vacations_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getVacationTypes/get_vacation_types_response_model.dart';

import '../network/network.dart';
import '../network/network_client.dart';

class DataSource extends IDataSource{
  Network networkClient = Network(networkClient: NetworkClient());

  @override
  Future<LoginResponseModel> performLogin(LoginRequestModel loginRequestModel) async {
    var res = await networkClient.post(EndPoints.login,
    data: loginRequestModel.toJson());
    return LoginResponseModel.fromJson(res);
  }

  @override
  Future<GetEmpVacationTypesResponseModel> getEmpVacationTypes(GetEmpVacationTypesRequestModel getEmpVacationTypesRequestModel) async {
    var res = await networkClient.post(EndPoints.getEmpVacationTypes,auth: true,
        data: getEmpVacationTypesRequestModel.toJson());
    return GetEmpVacationTypesResponseModel.fromJson(res);
  }

  @override
  Future<GetVacationTypesResponseModel> getVacationTypes() async {
    var res = await networkClient.post(EndPoints.getVacationTypes,auth: true,
        data:null);
    return GetVacationTypesResponseModel.fromJson(res);
  }

  @override
  Future<GetEmpAllVacationsResponseModel> getEmpAllVacations(GetEmpAllVacationsRequestModel getEmpAllVacationsRequestModel) async {
    var res = await networkClient.post(EndPoints.getEmpAllVacationRequests,auth: true,
        data:getEmpAllVacationsRequestModel.toJson());
    return GetEmpAllVacationsResponseModel.fromJson(res);
  }

}