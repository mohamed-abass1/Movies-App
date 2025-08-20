import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app1/core/providers/changeLanguageProvider.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInViewModel.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabViewModel.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/ProfileTabViewModel.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/MovieSearchViewModel.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetailsViewModel.dart';
import 'package:movies_app1/screen_details/On_Boarding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/bloc_observer.dart';
import 'core/cache/sha-pref.dart';
import 'core/providers/changeAvatarsProviders.dart';
import 'core/utils/app_colors.dart';
import 'di/di.dart';
import 'features/auth/Reset Password/Reset_Password.dart';
import 'features/auth/login screen/login_screen.dart';
import 'features/auth/register_screen/register_screen.dart';
import 'features/home_screen/tabs/search_tab/search_tab.dart';
import 'features/screens/MovieDetails/MovieDetails.dart';
import 'features/screens/update_profile/UpdateViewModel.dart';
import 'features/screens/update_profile/update_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentsDir.path);
  Hive.registerAdapter(MoviesDataEntityAdapter());
  Hive.registerAdapter(MoviesEntityAdapter());
  Hive.registerAdapter(MoviesListResponseEntityAdapter());

  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  String routeName;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token == null) {
    routeName = IntroScreen.route;
  } else {
    routeName = HomeScreen.routeName ;
  }
  runApp( MultiProvider(providers: [

    ChangeNotifierProvider(create: (context)=>ChangeAvatarProviders())],
  child: MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<MovieSearchViewModel>()),
    BlocProvider(create: (context) => getIt<ProfileTabViewModel>()),
    BlocProvider(create: (context) => getIt<LogInViewModel>()),
    BlocProvider(create: (context) => getIt<UpdateViewModel>()),
    BlocProvider(create: (context) => getIt<MovieDetailsViewModel>()),
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),],
  child: ChangeNotifierProvider(create: (BuildContext context) { return ChangeLanguageProviders(); },
  child: MyApp(routeName: routeName,)))));
}

class MyApp extends StatelessWidget {
  String routeName;
  MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
return
  MaterialApp(
  debugShowCheckedModeBanner: false,
 initialRoute:routeName,
    locale: Locale(Provider.of<ChangeLanguageProviders>(context).LanguageApp),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
 routes:{
   SearchTab.route:(context)=>SearchTab(),
   ResetPassword.initialRoute:(context)=>ResetPassword(),
   IntroScreen.route:(context)=>IntroScreen(),
   MovieDetails.routeName:(context)=>MovieDetails(),
   HomeScreen.routeName:(context)=>HomeScreen(),
   RegisterScreen.routeName:(context)=>RegisterScreen(),
    LoginScreen.initialRoute:(context)=>LoginScreen(),
    UpdateProfile.routeName:(context)=>UpdateProfile()} ,
  theme: ThemeData(scaffoldBackgroundColor: AppColors.BlackColor),
)
    ;
  }

  }
