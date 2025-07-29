import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/AddToFavouriteResponseDM.dart';
import 'package:movies_app1/data/model/RegisterResponseDM.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import 'package:movies_app1/domain/repository/data_source/RegisterDataSource.dart';

import '../../core/api__manger/api_manger.dart';
import '../../domain/entities/AddToFavouriteResponseEntity.dart';
import '../../domain/repository/data_source/AddToFavouriteSource.dart';
@Injectable(as: AddToFavouriteDataSource)
class AddToFavoriteDataSourceImpl implements AddToFavouriteDataSource{
  ApiManger apiManger;
  AddToFavoriteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, AddToFavouriteResponseEntity>> AddToFavourite(String imageURL,  String year,String movieId,int rating,String name) async {

      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response=await ApiManger().addToFavourite(imageURL, year, movieId, rating, name);
        var AddToFavourite=AddToFavouriteResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(AddToFavourite);
        } else {
          return Left(
              ServerError(errorMessage: AddToFavourite.message!));
        }
      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please Check Internet.'));
      }

  }}