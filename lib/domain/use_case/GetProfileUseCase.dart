import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/core/errors/Errors_File.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';
import '../repository/repository/GetProfileRepository.dart';
 @injectable
class GetProfileUseCase{
   GetProfileRepository getProfileRepository;
   GetProfileUseCase({required this.getProfileRepository});
Future<Either<Failures,RegisterResponseEntity>>invoke() async {
return getProfileRepository.GetProfile();
}}