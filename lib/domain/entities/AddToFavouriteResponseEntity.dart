class AddToFavouriteResponseEntity {
  AddToFavouriteResponseEntity({
      this.message, 
      this.data,});

  String? message;
  AddToFavouriteDataEntity? data;


}

class AddToFavouriteDataEntity {
  AddToFavouriteDataEntity({
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