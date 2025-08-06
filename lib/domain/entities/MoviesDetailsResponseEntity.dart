import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

class MoviesDetailsResponseEntity {
  MoviesDetailsResponseEntity({
      this.status, 
      this.statusMessage, 
      this.data, 
  });

  String? status;
  String? statusMessage;
  MovieDetailsDataEntity? data;


}



class MovieDetailsDataEntity {
  MovieDetailsDataEntity({
      this.movie,});

  MoviesDetailsEntity? movie;

}

class MoviesDetailsEntity {
  MoviesDetailsEntity({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.likeCount, 
      this.descriptionIntro, 
      this.descriptionFull, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.dateUploaded,
      this.dateUploadedUnix,});

  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  num? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? dateUploaded;
  num? dateUploadedUnix;


}
