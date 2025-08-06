import 'package:hive/hive.dart';
part 'MoviesListEntity.g.dart';
@HiveType(typeId: 1)
class MoviesListResponseEntity extends HiveObject {
  MoviesListResponseEntity({
      this.status, 
      this.statusMessage,
      this.data,
     });

  String? status;
  String? statusMessage;
  @HiveField(0)
  MoviesDataEntity? data;


}


@HiveType(typeId: 2)

class MoviesDataEntity extends HiveObject{
  MoviesDataEntity({
      this.movieCount, 
      this.limit, 
      this.pageNumber,
      this.movies,});

  num? movieCount;
  num? limit;
  num? pageNumber;
  @HiveField(1)

  List<MoviesEntity>? movies;


}
@HiveType(typeId: 3)
class MoviesEntity {
  MoviesEntity({
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

    this.summary,

    this.descriptionFull,

    this.synopsis,

    this.ytTrailerCode,

    this.language,

    this.mpaRating,


    this.backgroundImage,

    this.backgroundImageOriginal,

    this.smallCoverImage,

    this.mediumCoverImage,

    this.largeCoverImage,

    this.state,


    this.dateUploaded,

  this.dateUploadedUnix,});
  @HiveField(2)

  num? id;
  @HiveField(3)

  String? url;
  @HiveField(4)

  String? imdbCode;
  @HiveField(5)

  String? title;
  @HiveField(6)

  String? titleEnglish;
  @HiveField(7)

  String? titleLong;
  @HiveField(8)

  String? slug;
  @HiveField(9)

  num? year;
  @HiveField(10)

  num? rating;
  @HiveField(11)

  num? runtime;
  @HiveField(12)

  List<String>? genres;
  @HiveField(13)

  String? summary;
  @HiveField(14)

  String? descriptionFull;
  @HiveField(15)

  String? synopsis;
  @HiveField(16)

  String? ytTrailerCode;
  @HiveField(17)

  String? language;
  @HiveField(18)

  String? mpaRating;
  @HiveField(19)

  String? backgroundImage;
  @HiveField(20)

  String? backgroundImageOriginal;
  @HiveField(21)

  String? smallCoverImage;
  @HiveField(22)

  String? mediumCoverImage;
  @HiveField(23)


  String? largeCoverImage;
  @HiveField(24)

  String? state;

  @HiveField(26)

  String? dateUploaded;
  @HiveField(27)

  num? dateUploadedUnix;


}

