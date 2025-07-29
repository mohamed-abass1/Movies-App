import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/GetAllFavouriteResponseDM.dart';
import 'package:movies_app1/data/model/MoviesListResponseDM.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';

import '../../domain/repository/data_source/getMoviesFavouriteDataSource.dart';
@Injectable(as:GetMoviesFavouriteDataSource )
class GetMoviesDataSourceImpl implements GetMoviesFavouriteDataSource{
ApiManger apiManger;
GetMoviesDataSourceImpl({required this.apiManger});
  Future<Either<Failures, GetAllFavouriteResponseEntity>> getMoviesFavouriteList()async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await apiManger.getFavourite();
      var favouriteMoviesList = GetAllFavouriteResponseDm.fromJson(response.data);
      print(favouriteMoviesList.runtimeType);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(favouriteMoviesList);
      } else {
        return Left(ServerError(errorMessage: favouriteMoviesList.message!));
      }
    }
    else {
      return left(
          NetworkError(errorMessage: 'PLEASE CHECK YOUR INTERNET CONNECTION'));
    }
  }}