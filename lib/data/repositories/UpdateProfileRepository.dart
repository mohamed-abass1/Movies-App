import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app1/domain/entities/RegisterResponseEntity.dart';

import '../../core/errors/Errors_File.dart';
import '../../domain/repository/data_source/UpdateProfileDataSource.dart';
import '../../domain/repository/repository/UpdateProfileRepository.dart';
@Injectable(as:UpdateProfileRepository )
class UpdateProfileRepositoryImpl implements UpdateProfileRepository{
  UpdateProfileDataSource getProfileDataSource;
  UpdateProfileRepositoryImpl ({required this.getProfileDataSource});

  Future<Either<Failures, RegisterResponseEntity>> UpdateProfile(num? avatar) async {
    var either =await getProfileDataSource.UpdateProfile(avatar);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}