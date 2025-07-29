import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/MoviesListResponseDM.dart';
import 'package:movies_app1/domain/repository/data_source/getMoviesDataSource.dart';
@Injectable(as:GetMoviesDataSource )
class GetMoviesDataSourceImpl implements GetMoviesDataSource{
ApiManger apiManger;
GetMoviesDataSourceImpl({required this.apiManger});
  Future<Either<Failures, MoviesListResponseDm>> getMoviesList()async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
 try{
   if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
     var response = await apiManger.getMoviesList();
     var moviesList=MoviesListResponseDm.fromJson(response.data);
     if (response.statusCode! >= 200 && response.statusCode! < 300) {
       return Right(moviesList);
     } else {
       return Left(ServerError(errorMessage: moviesList.message!));
     }

   }
   else{return left( NetworkError(errorMessage: 'PLEASE CHECK YOUR INTERNET CONNECTION'));}
  }
  catch(e){return Left(ServerError( errorMessage:e.toString())); }
  }

}