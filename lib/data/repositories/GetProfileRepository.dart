import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../core/errors/Errors_File.dart';
import '../../domain/repository/data_source/GetProfileDataSource.dart';
import '../../domain/repository/repository/GetProfileRepository.dart';
@Injectable(as:GetProfileRepository )
class GetProfileRepositoryImpl implements GetProfileRepository{
  GetProfileDataSource getProfileDataSource;
  GetProfileRepositoryImpl ({required this.getProfileDataSource});

  Future<Either<Failures, RegisterResponseEntity>> GetProfile() async {
    var either =await getProfileDataSource.GetProfile();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}