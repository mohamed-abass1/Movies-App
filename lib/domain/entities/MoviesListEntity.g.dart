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
    return MoviesListResponseEntity();
  }

  @override
  void write(BinaryWriter writer, MoviesListResponseEntity obj) {
    writer.writeByte(0);
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
    return MoviesDataEntity();
  }

  @override
  void write(BinaryWriter writer, MoviesDataEntity obj) {
    writer.writeByte(0);
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
    return MoviesEntity();
  }

  @override
  void write(BinaryWriter writer, MoviesEntity obj) {
    writer.writeByte(0);
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
