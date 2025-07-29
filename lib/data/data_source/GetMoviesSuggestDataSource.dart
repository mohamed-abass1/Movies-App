import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/data/model/MoviesListResponseDM.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';


import '../../domain/repository/data_source/getMoviesDetailsDataSource.dart';
import '../../domain/repository/data_source/getMoviesSuggestDataSource.dart';
import '../model/MoviesDetailsResponseDM.dart';
@Injectable(as:GetMoviesSuggestDataSource )
class GetMoviesSuggestDataSourceImpl implements GetMoviesSuggestDataSource{
ApiManger apiManger;
GetMoviesSuggestDataSourceImpl({required this.apiManger});
  Future<Either<Failures, MoviesListResponseDm>> getSuggestMoviesList(String id)async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
 try{
   if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
     var response = await apiManger.getMoviesSuggest(id);
     var MovieDetails=MoviesListResponseDm.fromJson(response.data);
     if (response.statusCode! >= 200 && response.statusCode! < 300) {
       return Right(MovieDetails);
     } else {
       return Left(ServerError(errorMessage: MovieDetails.message!));
     }

   }
   else{return left( NetworkError(errorMessage: 'PLEASE CHECK YOUR INTERNET CONNECTION'));}
  }
  catch(e){return Left(ServerError( errorMessage:e.toString())); }
  }

}
