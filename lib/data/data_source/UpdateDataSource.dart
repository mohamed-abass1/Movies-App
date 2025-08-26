
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/RegisterResponseDM.dart';

import '../../core/api__manger/api_manger.dart';
import '../../domain/repository/data_source/UpdateProfileDataSource.dart';
@Injectable(as: UpdateProfileDataSource)
class UpdateProfileDataSourceImpl implements UpdateProfileDataSource{
  ApiManger apiManger;
  UpdateProfileDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RegisterResponseDm>> UpdateProfile(email,num? avatar) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await apiManger.updateProfile(email,avatar);
        var logInResponse=RegisterResponseDm.fromJson(response.data);
        print('MESSAGE${logInResponse.message}');
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