import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/IsFavouriteResponseDM.dart';

import '../../domain/entities/IsFavouriteResponseEntity.dart';

import '../../domain/repository/data_source/RemoveMoviesFavouriteDataSource.dart';
@Injectable(as:RemoveMoviesFavouriteDataSource )
class RemoveMoviesDataSourceImpl implements RemoveMoviesFavouriteDataSource{
ApiManger apiManger;
RemoveMoviesDataSourceImpl({required this.apiManger});
  Future<Either<Failures, IsFavouriteResponseEntity>> RemoveMoviesFavouriteList(String id)async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      var response = await apiManger.RemoveFavourite(id);
      var favouriteMoviesList = IsFavouriteResponseDm.fromJson(response.data);
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