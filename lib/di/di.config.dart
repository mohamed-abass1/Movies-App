// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api__manger/api_manger.dart' as _i485;
import '../data/data_source/AddToFavoriteDataSource.dart' as _i410;
import '../data/data_source/Get50MoviesDataSource.dart' as _i285;
import '../data/data_source/GetFavouriteMoviesDataSource.dart' as _i163;
import '../data/data_source/GetMoviesDataSource.dart' as _i230;
import '../data/data_source/GetMoviesDetailsDataSource.dart' as _i299;
import '../data/data_source/GetMoviesSearchDataSource.dart' as _i372;
import '../data/data_source/GetMoviesSuggestDataSource.dart' as _i147;
import '../data/data_source/GetProfileDataSource.dart' as _i1002;
import '../data/data_source/IsFavouriteMoviesDataSource.dart' as _i597;
import '../data/data_source/LogInDataSource.dart' as _i1015;
import '../data/data_source/RegisterDataSource.dart' as _i976;
import '../data/data_source/RemoveFavouriteMoviesDataSource.dart' as _i680;
import '../data/data_source/ResetPasswordDataSource.dart' as _i1069;
import '../data/data_source/UpdateDataSource.dart' as _i566;
import '../data/repositories/50MoviesListRepository.dart' as _i391;
import '../data/repositories/AddToFavouriteRepository.dart' as _i1011;
import '../data/repositories/FavouriteMoviesListRepository.dart' as _i1036;
import '../data/repositories/GetProfileRepository.dart' as _i283;
import '../data/repositories/IsFavouriteMoviesListRepository.dart' as _i621;
import '../data/repositories/LogInRepository.dart' as _i656;
import '../data/repositories/MovieDetailsRepository.dart' as _i828;
import '../data/repositories/MoviesListRepository.dart' as _i411;
import '../data/repositories/MoviesSearchRepository.dart' as _i10;
import '../data/repositories/MovieSuggestRepository.dart.dart' as _i728;
import '../data/repositories/RegisterRepository.dart' as _i209;
import '../data/repositories/RemoveFavouriteMoviesListRepository.dart' as _i456;
import '../data/repositories/ResetPasswordRepository.dart' as _i214;
import '../data/repositories/UpdateProfileRepository.dart' as _i395;
import '../domain/repository/data_source/AddToFavouriteSource.dart' as _i531;
import '../domain/repository/data_source/get50MoviesDataSource.dart' as _i74;
import '../domain/repository/data_source/getMoviesDataSource.dart' as _i909;
import '../domain/repository/data_source/getMoviesDetailsDataSource.dart'
    as _i44;
import '../domain/repository/data_source/getMoviesFavouriteDataSource.dart'
    as _i503;
import '../domain/repository/data_source/getMoviesSearchDataSource.dart'
    as _i11;
import '../domain/repository/data_source/getMoviesSuggestDataSource.dart'
    as _i1006;
import '../domain/repository/data_source/GetProfileDataSource.dart' as _i264;
import '../domain/repository/data_source/IsMoviesFavouriteDataSource.dart'
    as _i558;
import '../domain/repository/data_source/LogInDataSource.dart' as _i813;
import '../domain/repository/data_source/RegisterDataSource.dart' as _i353;
import '../domain/repository/data_source/RemoveMoviesFavouriteDataSource.dart'
    as _i143;
import '../domain/repository/data_source/ResetPasswordDataSource.dart' as _i33;
import '../domain/repository/data_source/UpdateProfileDataSource.dart'
    as _i1062;
import '../domain/repository/repository/AddToFavouriteRepository.dart' as _i55;
import '../domain/repository/repository/Get50MoviesDataSource.dart' as _i153;
import '../domain/repository/repository/GetFavouriteMoviesDataSource.dart'
    as _i132;
import '../domain/repository/repository/GetMoviesDataSource.dart' as _i990;
import '../domain/repository/repository/GetMoviesDetailsDataSource.dart'
    as _i805;
import '../domain/repository/repository/GetMoviesSerachRepository.dart'
    as _i648;
import '../domain/repository/repository/GetMoviesSuggestDataSource.dart'
    as _i1001;
import '../domain/repository/repository/GetProfileRepository.dart' as _i1000;
import '../domain/repository/repository/IstFavouriteMoviesDataSource.dart'
    as _i99;
import '../domain/repository/repository/LogInRepository.dart' as _i778;
import '../domain/repository/repository/RegisterRepository.dart' as _i280;
import '../domain/repository/repository/RemoveFavouriteMoviesDataSource.dart'
    as _i184;
import '../domain/repository/repository/ResetPasswordRepository.dart' as _i570;
import '../domain/repository/repository/UpdateProfileRepository.dart' as _i788;
import '../domain/use_case/AddToFavouriteUseCase.dart' as _i1057;
import '../domain/use_case/Get50MoviesUseCase.dart' as _i225;
import '../domain/use_case/GetFavouriteMoviesUseCase.dart' as _i323;
import '../domain/use_case/GetMoviesDetailsUseCase.dart' as _i325;
import '../domain/use_case/GetMoviesSearchUseCase.dart' as _i387;
import '../domain/use_case/GetMoviesSuggestUseCase.dart' as _i949;
import '../domain/use_case/GetMoviesUseCase.dart' as _i231;
import '../domain/use_case/GetProfileUseCase.dart' as _i242;
import '../domain/use_case/IsFavouriteMoviesUseCase.dart' as _i1072;
import '../domain/use_case/LogInUseCase.dart' as _i786;
import '../domain/use_case/RegisterUseCase.dart' as _i734;
import '../domain/use_case/RemoveFavouriteMoviesUseCase.dart' as _i378;
import '../domain/use_case/ResetPasswordUseCase.dart' as _i631;
import '../domain/use_case/UpdateUseCase.dart' as _i718;
import '../features/auth/login%20screen/LogInViewModel.dart' as _i380;
import '../features/auth/register_screen/RegisterViewModel.dart' as _i1000;
import '../features/auth/Reset%20Password/ResetPasswordViewModel.dart' as _i970;
import '../features/home_screen/tabs/browse_tab/BrowseTabViewModel.dart'
    as _i1028;
import '../features/home_screen/tabs/home_tab/homeTabViewModel.dart' as _i416;
import '../features/home_screen/tabs/profile_tab/ProfileTabViewModel.dart'
    as _i812;
import '../features/home_screen/tabs/search_tab/MovieSearchViewModel.dart'
    as _i978;
import '../features/screens/MovieDetails/MovieDetailsViewModel.dart' as _i185;
import '../features/screens/update_profile/UpdateViewModel.dart' as _i192;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i485.ApiManger>(() => _i485.ApiManger());
    gh.factory<_i11.GetMoviesSearchDataSource>(() =>
        _i372.GetMoviesSearchDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i143.RemoveMoviesFavouriteDataSource>(() =>
        _i680.RemoveMoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i264.GetProfileDataSource>(() =>
        _i1002.GetProfileDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i1062.UpdateProfileDataSource>(() =>
        _i566.UpdateProfileDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i558.IsMoviesFavouriteDataSource>(
        () => _i597.IsMoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i648.GetMoviesSearchRepository>(() =>
        _i10.MoviesListSearchRepositoryImpl(
            getMoviesSearchDataSource: gh<_i11.GetMoviesSearchDataSource>()));
    gh.factory<_i44.GetMoviesDetailsDataSource>(
        () => _i299.GetMoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i813.LogInDataSource>(
        () => _i1015.LogInDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i1006.GetMoviesSuggestDataSource>(() =>
        _i147.GetMoviesSuggestDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i531.AddToFavouriteDataSource>(() =>
        _i410.AddToFavoriteDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i788.UpdateProfileRepository>(() =>
        _i395.UpdateProfileRepositoryImpl(
            getProfileDataSource: gh<_i1062.UpdateProfileDataSource>()));
    gh.factory<_i1000.GetProfileRepository>(() =>
        _i283.GetProfileRepositoryImpl(
            getProfileDataSource: gh<_i264.GetProfileDataSource>()));
    gh.factory<_i778.LogInRepository>(() => _i656.LogInRepositoryImpl(
        logInDataSource: gh<_i813.LogInDataSource>()));
    gh.factory<_i786.LogInUseCase>(
        () => _i786.LogInUseCase(logInRepository: gh<_i778.LogInRepository>()));
    gh.factory<_i353.RegisterDataSource>(
        () => _i976.RegisterDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i184.RemoveFavouriteMoviesRepository>(() =>
        _i456.RemoveMoviesFavouriteListRepositoryImpl(
            getMoviesDataSource: gh<_i143.RemoveMoviesFavouriteDataSource>()));
    gh.factory<_i74.Get50MoviesDataSource>(() =>
        _i285.Get50MoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i805.GetMoviesDetailsRepository>(() =>
        _i828.MoviesDetailsRepositoryImpl(
            getMoviesDataSource: gh<_i44.GetMoviesDetailsDataSource>()));
    gh.factory<_i503.GetMoviesFavouriteDataSource>(
        () => _i163.GetMoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i33.ResetPasswordDataSource>(() =>
        _i1069.ResetPasswordDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i99.IsFavouriteMoviesRepository>(() =>
        _i621.IsMoviesFavouriteListRepositoryImpl(
            getMoviesDataSource: gh<_i558.IsMoviesFavouriteDataSource>()));
    gh.factory<_i909.GetMoviesDataSource>(
        () => _i230.GetMoviesDataSourceImpl(apiManger: gh<_i485.ApiManger>()));
    gh.factory<_i153.Get50MoviesRepository>(() =>
        _i391.Movies50ListRepositoryImpl(
            get50MoviesDataSource: gh<_i74.Get50MoviesDataSource>()));
    gh.factory<_i132.GetFavouriteMoviesRepository>(() =>
        _i1036.MoviesFavouriteListRepositoryImpl(
            getMoviesDataSource: gh<_i503.GetMoviesFavouriteDataSource>()));
    gh.factory<_i325.GetMoviesDetailsUseCase>(() =>
        _i325.GetMoviesDetailsUseCase(
            getMoviesRepository: gh<_i805.GetMoviesDetailsRepository>()));
    gh.factory<_i1001.GetMoviesSuggestRepository>(() =>
        _i728.MoviesSuggestRepositoryImpl(
            getMoviesDataSource: gh<_i1006.GetMoviesSuggestDataSource>()));
    gh.factory<_i387.GetMoviesSearchUseCase>(() => _i387.GetMoviesSearchUseCase(
        getMoviesSearchRepository: gh<_i648.GetMoviesSearchRepository>()));
    gh.factory<_i990.GetMoviesRepository>(() => _i411.MoviesListRepositoryImpl(
        getMoviesDataSource: gh<_i909.GetMoviesDataSource>()));
    gh.factory<_i55.AddToFavouriteRepository>(() =>
        _i1011.AddToFavouriteRepositoryImpl(
            logInDataSource: gh<_i531.AddToFavouriteDataSource>()));
    gh.factory<_i378.RemoveFavouriteMoviesUseCase>(() =>
        _i378.RemoveFavouriteMoviesUseCase(
            isFavouriteMoviesRepository:
                gh<_i184.RemoveFavouriteMoviesRepository>()));
    gh.factory<_i225.Get50MoviesUseCase>(() => _i225.Get50MoviesUseCase(
        get50MoviesRepository: gh<_i153.Get50MoviesRepository>()));
    gh.factory<_i570.ResetPasswordRepository>(() =>
        _i214.ResetPasswordRepositoryImpl(
            logInDataSource: gh<_i33.ResetPasswordDataSource>()));
    gh.factory<_i718.UpdateProfileUseCase>(() => _i718.UpdateProfileUseCase(
        updateProfileRepository: gh<_i788.UpdateProfileRepository>()));
    gh.factory<_i280.RegisterRepository>(() => _i209.RegisterRepositoryImpl(
        registerDataSource: gh<_i353.RegisterDataSource>()));
    gh.factory<_i380.LogInViewModel>(
        () => _i380.LogInViewModel(logInUseCase: gh<_i786.LogInUseCase>()));
    gh.factory<_i949.GetMoviesSuggestUseCase>(() =>
        _i949.GetMoviesSuggestUseCase(
            getMoviesRepository: gh<_i1001.GetMoviesSuggestRepository>()));
    gh.factory<_i242.GetProfileUseCase>(() => _i242.GetProfileUseCase(
        getProfileRepository: gh<_i1000.GetProfileRepository>()));
    gh.factory<_i1072.IsFavouriteMoviesUseCase>(() =>
        _i1072.IsFavouriteMoviesUseCase(
            isFavouriteMoviesRepository:
                gh<_i99.IsFavouriteMoviesRepository>()));
    gh.factory<_i231.GetMoviesUseCase>(() => _i231.GetMoviesUseCase(
        getMoviesRepository: gh<_i990.GetMoviesRepository>()));
    gh.factory<_i192.UpdateViewModel>(() => _i192.UpdateViewModel(
        updateProfileUseCase: gh<_i718.UpdateProfileUseCase>()));
    gh.factory<_i978.MovieSearchViewModel>(() => _i978.MovieSearchViewModel(
        moviesSearchUseCase: gh<_i387.GetMoviesSearchUseCase>()));
    gh.factory<_i1057.AddToFavouriteUseCase>(() => _i1057.AddToFavouriteUseCase(
        addToFavourite: gh<_i55.AddToFavouriteRepository>()));
    gh.factory<_i1028.BrowseTabViewModel>(() => _i1028.BrowseTabViewModel(
        get50MoviesUseCase: gh<_i225.Get50MoviesUseCase>()));
    gh.factory<_i323.GetFavouriteMoviesUseCase>(() =>
        _i323.GetFavouriteMoviesUseCase(
            getFavouriteMoviesRepository:
                gh<_i132.GetFavouriteMoviesRepository>()));
    gh.factory<_i631.ResetPasswordUseCase>(() => _i631.ResetPasswordUseCase(
        logInRepository: gh<_i570.ResetPasswordRepository>()));
    gh.factory<_i734.RegisterUseCase>(() => _i734.RegisterUseCase(
        registerRepository: gh<_i280.RegisterRepository>()));
    gh.factory<_i416.HomeTabViewModel>(() => _i416.HomeTabViewModel(
          getMoviesUseCase: gh<_i231.GetMoviesUseCase>(),
          get50MoviesUseCase: gh<_i225.Get50MoviesUseCase>(),
        ));
    gh.factory<_i185.MovieDetailsViewModel>(() => _i185.MovieDetailsViewModel(
          removeFavouriteMoviesUseCase:
              gh<_i378.RemoveFavouriteMoviesUseCase>(),
          addMovieToFavouriteUseCase: gh<_i1057.AddToFavouriteUseCase>(),
          moviesSuggestCase: gh<_i949.GetMoviesSuggestUseCase>(),
          moviesDetailsUseCase: gh<_i325.GetMoviesDetailsUseCase>(),
          isFavouriteMoviesUseCase: gh<_i1072.IsFavouriteMoviesUseCase>(),
        ));
    gh.factory<_i970.ResetPasswordViewModel>(() => _i970.ResetPasswordViewModel(
        logInUseCase: gh<_i631.ResetPasswordUseCase>()));
    gh.factory<_i812.ProfileTabViewModel>(() => _i812.ProfileTabViewModel(
          getProfileUseCase: gh<_i242.GetProfileUseCase>(),
          get50MoviesUseCase: gh<_i323.GetFavouriteMoviesUseCase>(),
        ));
    gh.factory<_i1000.RegisterViewModel>(() =>
        _i1000.RegisterViewModel(registerUseCase: gh<_i734.RegisterUseCase>()));
    return this;
  }
}
