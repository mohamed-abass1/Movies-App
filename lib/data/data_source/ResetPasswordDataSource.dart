
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/LogInResponseDM.dart';
import '../../core/api__manger/api_manger.dart';
import '../../domain/entities/LogInResponseEntity.dart';
import '../../domain/repository/data_source/ResetPasswordDataSource.dart';
@Injectable(as: ResetPasswordDataSource)
class ResetPasswordDataSourceImpl implements ResetPasswordDataSource{
  ApiManger apiManger;
  ResetPasswordDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, LogInResponseEntity>> ResetPassword(String oldPassword,String newPassword) async {

      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await apiManger.resetPassword(oldPassword: oldPassword, newPassword:newPassword  );

        var RegisterResponse=LogInResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(RegisterResponse);
        } else {
          return Left(
              ServerError(errorMessage: RegisterResponse.message!));
        }
      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please Check Internet.'));
      }

  }}