import 'package:movies_app1/data/model/MoviesListResponseDM.dart';
import 'package:movies_app1/domain/entities/MoviesDetailsResponseEntity.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';

class MoviesDetailsResponseDm extends MoviesDetailsResponseEntity {
  MoviesDetailsResponseDm({
      super.status,
      super.statusMessage,
      super.data,
    this.message,});
String? message;
  MoviesDetailsResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];

    statusMessage = json['status_message'];
    data = json['data'] != null ? MovieDetailsDataDM.fromJson(json['data']) : null;
  }


}


class MovieDetailsDataDM extends MovieDetailsDataEntity{
  MovieDetailsDataDM({
      super.movie,});

  MovieDetailsDataDM.fromJson(dynamic json) {
    movie = json['movie'] != null ? MovieDetailsDM.fromJson(json['movie']) : null;
  }
}

class MovieDetailsDM extends MoviesDetailsEntity {
  MovieDetailsDM({
      super.id,
      super.url,
    super.imdbCode,
    super.title,
    super.titleEnglish,
    super.titleLong,
    super.slug,
    super.year,
    super.rating,
    super.runtime,
    super.genres,
    super.likeCount,
    super.descriptionIntro,
    super.descriptionFull,
    super.ytTrailerCode,
    super.language,
    super.mpaRating,
    super.backgroundImage,
    super.backgroundImageOriginal,
    super.smallCoverImage,
    super.mediumCoverImage,
    super.largeCoverImage,
    super.dateUploaded,
    super.dateUploadedUnix,});

  MovieDetailsDM.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }


}

