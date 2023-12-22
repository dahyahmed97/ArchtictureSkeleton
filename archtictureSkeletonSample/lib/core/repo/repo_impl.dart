import 'package:archtictureskeletonsample/core/dataSource/data_source.dart';
import 'package:archtictureskeletonsample/core/error/failures.dart';
import 'package:archtictureskeletonsample/core/network/network_info.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
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


 
}