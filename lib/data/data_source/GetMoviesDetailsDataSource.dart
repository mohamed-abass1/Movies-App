import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/api__manger/api_manger.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';


import '../../domain/repository/data_source/getMoviesDetailsDataSource.dart';
import '../model/MoviesDetailsResponseDM.dart';
@Injectable(as:GetMoviesDetailsDataSource )
class GetMoviesDataSourceImpl implements GetMoviesDetailsDataSource{
ApiManger apiManger;
GetMoviesDataSourceImpl({required this.apiManger});
  Future<Either<Failures, MoviesDetailsResponseDm>> getDetailsMoviesList(String id)async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
 try{
   if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)) {
     var response = await apiManger.getMoviesDetails(id);
     var MovieDetails=MoviesDetailsResponseDm.fromJson(response.data);
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