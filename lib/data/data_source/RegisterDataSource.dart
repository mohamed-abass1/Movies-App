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
@Injectable(as: RegisterDataSource)
class RegisterDataSourceImpl implements RegisterDataSource{
  ApiManger apiManger;
  RegisterDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register({required String name,
      required String email, required String password, required String rePassword, required String phone}) async {

      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await ApiManger().register( data: {
          "name":name,
          "email":email,
          "password":password,
          "confirmPassword":rePassword,
          "phone":phone,
          "avaterId":1
        });
        print("TYPE = ${response.data.runtimeType}");
        print("DATA = ${response.data}");
        var RegisterResponse=RegisterResponseDm.fromJson(response.data);
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