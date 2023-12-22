import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../features/auth/login/models/login_response_model.dart';
import '../error/failures.dart';

abstract class IRepository {
  Future<Either<Failure,LoginResponseModel>> performLogin(LoginRequestModel loginRequestModel);
}