import 'package:hive/hive.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
class MoviesListResponseDm extends MoviesListResponseEntity{
  MoviesListResponseDm({
      super.status,
      super.statusMessage,
      super.data,
    this.message
      });
String? message;
  MoviesListResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];

    statusMessage = json['status_message'];
    data = json['data'] != null ? MoviesDataDM.fromJson(json['data']) : null;
  }
}


class MoviesDataDM extends MoviesDataEntity {
  MoviesDataDM({
      super.movieCount,
      super.limit,
      super.pageNumber,
      super.movies,});

  MoviesDataDM.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(MoviesDM.fromJson(v));
      });
    }
  }



}

class MoviesDM extends MoviesEntity{
  MoviesDM({
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

    super.summary,

    super.descriptionFull,

    super.synopsis,

    super.ytTrailerCode,

    super.language,

    super.mpaRating,

    super.backgroundImage,

    super.backgroundImageOriginal,
    super.smallCoverImage,
    super.mediumCoverImage,
    super.largeCoverImage,
    super.state,
    super.dateUploaded,

    super.dateUploadedUnix,});

  MoviesEntity toEntity() {
    return MoviesEntity(
      id: id,
      url: url,
      imdbCode: imdbCode,
      title: title,
      titleEnglish: titleEnglish,
      titleLong: titleLong,
      slug: slug,
      year: year,
      rating: rating,
      runtime: runtime,
      genres: genres,
      summary: summary,
      descriptionFull: descriptionFull,
      synopsis: synopsis,
      ytTrailerCode: ytTrailerCode,
      language: language,
      mpaRating: mpaRating,
      backgroundImage: backgroundImage,
      backgroundImageOriginal: backgroundImageOriginal,
      smallCoverImage: smallCoverImage,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      state: state,
      dateUploaded: dateUploaded,
      dateUploadedUnix: dateUploadedUnix,
    );
  }
  MoviesDM.fromJson(dynamic json) {
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
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }




}

