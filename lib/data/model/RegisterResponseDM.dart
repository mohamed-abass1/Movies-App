import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.data,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'].toString();
    data = json['data'] != null ? RegisterDataDM.fromJson(json['data']) : null;
  }

}

class RegisterDataDM extends RegisterDataEntity{
  RegisterDataDM({
      super.email,
    super.password,
    super.name,
    super.phone,
    super.avaterId,
    super.id,
    super.createdAt,
    super.updatedAt,
    });

  RegisterDataDM.fromJson(dynamic json) {
    email = json['email'].toString();
    password = json['password'].toString();
    name = json['name'].toString();
    phone = json['phone'].toString();
    id = json['_id'].toString();
    avaterId=json['avaterId'];
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();

  }
  String? email;
  String? password;
  String? name;
  String? phone;
  num? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;



}