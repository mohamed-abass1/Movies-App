import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';

class GetAllFavouriteResponseDm extends GetAllFavouriteResponseEntity {
  GetAllFavouriteResponseDm({
    super.message,
    super.data,
  });

  GetAllFavouriteResponseDm.fromJson(dynamic json) {
    message = json['message'].toString();

    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((item) => GetAllFavouriteDataDM.fromJson(item))
          .toList();
    }
  }
}

class GetAllFavouriteDataDM extends GetAllFavouriteDataEntity {
  GetAllFavouriteDataDM({
    super.movieId,
    super.name,
    super.rating,
    super.imageURL,
    super.year,
  });

  GetAllFavouriteDataDM.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }
}
