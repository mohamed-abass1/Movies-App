import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/RegisterResponseDM.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/data_source/RegisterDataSource.dart';

import '../../core/api__manger/api_manger.dart';
import '../../domain/entities/LogInResponseEntity.dart';
import '../../domain/repository/data_source/LogInDataSource.dart';
import '../model/LogInResponseDM.dart';
@Injectable(as: LogInDataSource)
class LogInDataSourceImpl implements LogInDataSource{
  ApiManger apiManger;
  LogInDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, LogInResponseEntity>> LogIn({required String email, required String password,}) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await ApiManger.logIn( email,password);
        print('response body${response.body}');
        var logInResponse=LogInResponseDm.fromJson(jsonDecode(response.body));
        if (response.statusCode >= 200 && response.statusCode < 300) {
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