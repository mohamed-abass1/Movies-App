import 'package:hive/hive.dart';
part 'MoviesListEntity.g.dart';
@HiveType(typeId: 1)
class MoviesListResponseEntity extends HiveObject {
  MoviesListResponseEntity({
      this.status, 
      this.statusMessage,
    @HiveField(0)
      this.data, 
     });

  String? status;
  String? statusMessage;
  MoviesDataEntity? data;


}


@HiveType(typeId: 2)

class MoviesDataEntity {
  MoviesDataEntity({
      this.movieCount, 
      this.limit, 
      this.pageNumber,
    @HiveField(0)
      this.movies,});

  num? movieCount;
  num? limit;
  num? pageNumber;
  List<MoviesEntity>? movies;


}
@HiveType(typeId: 3)
class MoviesEntity {
  MoviesEntity({
    @HiveField(0)
      this.id,
    @HiveField(1)
    this.url,
    @HiveField(2)
    this.imdbCode,
    @HiveField(3)

    this.title,
    @HiveField(4)

    this.titleEnglish,
    @HiveField(5)

    this.titleLong,
    @HiveField(6)

    this.slug,
    @HiveField(7)

    this.year,
    @HiveField(8)

    this.rating,
    @HiveField(9)

    this.runtime,
    @HiveField(10)

    this.genres,
    @HiveField(11)

    this.summary,
    @HiveField(12)

    this.descriptionFull,
    @HiveField(13)

    this.synopsis,
    @HiveField(14)

    this.ytTrailerCode,
    @HiveField(15)

    this.language,
    @HiveField(16)

    this.mpaRating,
    @HiveField(17)


    this.backgroundImage,
    @HiveField(18)

    this.backgroundImageOriginal,
    @HiveField(19)

    this.smallCoverImage,
    @HiveField(20)

    this.mediumCoverImage,
    @HiveField(21)

    this.largeCoverImage,
    @HiveField(22)

    this.state,
    @HiveField(23)

    this.torrents,
    @HiveField(24)

    this.dateUploaded,
  @HiveField(25)

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
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<TorrentsEntity>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;


}

class TorrentsEntity {
  TorrentsEntity({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;


}