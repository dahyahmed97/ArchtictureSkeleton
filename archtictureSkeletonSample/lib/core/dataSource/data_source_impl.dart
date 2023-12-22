import 'package:archtictureskeletonsample/core/dataSource/data_source.dart';
import 'package:archtictureskeletonsample/core/utils/endpoints.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';

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

}