class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.data,});

  String? message;
  RegisterDataEntity? data;


}

class RegisterDataEntity {
  RegisterDataEntity({
      this.email, 
      this.password, 
      this.name, 
      this.phone, 
      this.avaterId, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      });

  String? email;
  String? password;
  String? name;
  String? phone;
  num? avaterId;
  String? id;
  String? createdAt;
  String? updatedAt;

}