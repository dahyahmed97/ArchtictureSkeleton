import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';

import '../../features/auth/login/models/login_response_model.dart';

abstract class IDataSource{
Future<LoginResponseModel> performLogin(LoginRequestModel loginRequestModel);
}