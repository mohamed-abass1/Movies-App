import 'package:movies_app1/domain/entities/AddToFavouriteResponseEntity.dart';

class AddToFavouriteResponseDm extends AddToFavouriteResponseEntity {
  AddToFavouriteResponseDm({
      super.message,
      super.data,});

  AddToFavouriteResponseDm.fromJson(dynamic json) {
    message = json['message'].toString();
    data = json['data'] != null ? AddToFavouriteDataDM.fromJson(json['data']) : null;
  }



}

class AddToFavouriteDataDM extends AddToFavouriteDataEntity{
  AddToFavouriteDataDM({
      super.movieId,
      super.name,
      super.rating,
      super.imageURL,
      super.year,});

  AddToFavouriteDataDM.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = json['rating'];
    imageURL = json['imageURL'];
    year = json['year'];
  }

}