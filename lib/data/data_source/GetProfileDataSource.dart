
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/RegisterResponseDM.dart';

import '../../core/api__manger/api_manger.dart';
import '../../domain/repository/data_source/GetProfileDataSource.dart';
@Injectable(as: GetProfileDataSource)
class GetProfileDataSourceImpl implements GetProfileDataSource{
  ApiManger apiManger;
  GetProfileDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RegisterResponseDm>> GetProfile() async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await ApiManger().getProfile();
        print('response body${response.data}');
        var logInResponse=RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(logInResponse);
        } else {
          return Left(
              ServerError(errorMessage: logInResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }}