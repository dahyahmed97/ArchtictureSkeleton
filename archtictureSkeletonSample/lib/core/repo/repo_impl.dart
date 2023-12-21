import 'package:archtictureskeletonsample/core/dataSource/data_source.dart';
import 'package:archtictureskeletonsample/core/network/network_info.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

import 'base_repo.dart';

class Repository extends BaseRepository implements IRepository {
 late IDataSource dataSource;

  Repository(IDataSource appDataSource) : super(NetworkInfo(con: DataConnectionChecker())){
    dataSource=appDataSource;
  }

 
}