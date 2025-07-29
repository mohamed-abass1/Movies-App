class GetAllFavouriteResponseEntity {
  GetAllFavouriteResponseEntity({
      this.message, 
      this.data,});

  String? message;
  List<GetAllFavouriteDataEntity>? data;


}

class GetAllFavouriteDataEntity {
  GetAllFavouriteDataEntity({
      this.movieId, 
      this.name, 
      this.rating, 
      this.imageURL, 
      this.year,});

  String? movieId;
  String? name;
  num? rating;
  String? imageURL;
  String? year;


}