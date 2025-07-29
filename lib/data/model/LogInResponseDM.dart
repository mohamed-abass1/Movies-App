import 'package:movies_app1/domain/entities/LogInResponseEntity.dart';

class LogInResponseDm extends LogInResponseEntity{
  LogInResponseDm({
      super.message,
       super.data,});

  LogInResponseDm.fromJson(dynamic json) {
    message = json['message'].toString()  ;
    data = json['data'];
  }


}