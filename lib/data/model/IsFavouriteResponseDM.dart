import 'package:movies_app1/domain/entities/IsFavouriteResponseEntity.dart';

class IsFavouriteResponseDm extends IsFavouriteResponseEntity {
  IsFavouriteResponseDm({
      super.message,
      super.data,});

  IsFavouriteResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }


}