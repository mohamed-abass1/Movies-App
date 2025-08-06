import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/MoviesListResponseDM.dart';

import '../../domain/repository/data_source/getMoviesSearchDataSource.dart';
@Injectable(as:GetMoviesSearchDataSource )
class GetMoviesSearchDataSourceImpl implements GetMoviesSearchDataSource{
ApiManger apiManger;
GetMoviesSearchDataSourceImpl({required this.apiManger});
  Future<Either<Failures, MoviesListResponseDm>> getMoviesSearchList(String search)async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
 try{
   if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
     var response = await apiManger.getMoviesSearch(search);
     var moviesListSearch=MoviesListResponseDm.fromJson(response.data);
     if (response.statusCode! >= 200 && response.statusCode! < 300) {
       return Right(moviesListSearch);
     } else {
       return Left(ServerError(errorMessage: moviesListSearch.message!));
     }

   }
   else{return left( NetworkError(errorMessage: 'PLEASE CHECK YOUR INTERNET CONNECTION'));}
  }
  catch(e){return Left(ServerError( errorMessage:e.toString())); }
  }

}
