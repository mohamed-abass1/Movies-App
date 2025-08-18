// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesListEntity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesListResponseEntityAdapter
    extends TypeAdapter<MoviesListResponseEntity> {
  @override
  final int typeId = 1;

  @override
  MoviesListResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesListResponseEntity(
      data: fields[0] as MoviesDataEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesListResponseEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesListResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoviesDataEntityAdapter extends TypeAdapter<MoviesDataEntity> {
  @override
  final int typeId = 2;

  @override
  MoviesDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesDataEntity(
      movies: (fields[1] as List?)?.cast<MoviesEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, MoviesDataEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.movies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoviesEntityAdapter extends TypeAdapter<MoviesEntity> {
  @override
  final int typeId = 3;

  @override
  MoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesEntity(
      id: fields[2] as num?,
      url: fields[3] as String?,
      imdbCode: fields[4] as String?,
      title: fields[5] as String?,
      titleEnglish: fields[6] as String?,
      titleLong: fields[7] as String?,
      slug: fields[8] as String?,
      year: fields[9] as num?,
      rating: fields[10] as num?,
      runtime: fields[11] as num?,
      genres: (fields[12] as List?)?.cast<String>(),
      summary: fields[13] as String?,
      descriptionFull: fields[14] as String?,
      synopsis: fields[15] as String?,
      ytTrailerCode: fields[16] as String?,
      language: fields[17] as String?,
      mpaRating: fields[18] as String?,
      backgroundImage: fields[19] as String?,
      backgroundImageOriginal: fields[20] as String?,
      smallCoverImage: fields[21] as String?,
      mediumCoverImage: fields[22] as String?,
      largeCoverImage: fields[23] as String?,
      state: fields[24] as String?,
      dateUploaded: fields[26] as String?,
      dateUploadedUnix: fields[27] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesEntity obj) {
    writer
      ..writeByte(25)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.imdbCode)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.titleEnglish)
      ..writeByte(7)
      ..write(obj.titleLong)
      ..writeByte(8)
      ..write(obj.slug)
      ..writeByte(9)
      ..write(obj.year)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.runtime)
      ..writeByte(12)
      ..write(obj.genres)
      ..writeByte(13)
      ..write(obj.summary)
      ..writeByte(14)
      ..write(obj.descriptionFull)
      ..writeByte(15)
      ..write(obj.synopsis)
      ..writeByte(16)
      ..write(obj.ytTrailerCode)
      ..writeByte(17)
      ..write(obj.language)
      ..writeByte(18)
      ..write(obj.mpaRating)
      ..writeByte(19)
      ..write(obj.backgroundImage)
      ..writeByte(20)
      ..write(obj.backgroundImageOriginal)
      ..writeByte(21)
      ..write(obj.smallCoverImage)
      ..writeByte(22)
      ..write(obj.mediumCoverImage)
      ..writeByte(23)
      ..write(obj.largeCoverImage)
      ..writeByte(24)
      ..write(obj.state)
      ..writeByte(26)
      ..write(obj.dateUploaded)
      ..writeByte(27)
      ..write(obj.dateUploadedUnix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
