import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabStates.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabViewModel.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetails.dart';
import 'package:movies_app1/reusable_widget/moviesListViewer.dart';
import 'package:movies_app1/screen_details/listView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: HomeTabViewModel.get(context)..getMoviesList()..get50MoviesList(),
      builder: (context, state) {

        if (state is HomeTabDownloadState){return CircularProgressIndicator(color: AppColors.PrimaryColor,);}
        if (state is HomeTabErrorState){return Center(child: Text(state.error.errorMessage,style: FontTheme.bold18Primary,));}
  else{
    return Scaffold(

          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                  BlocBuilder<HomeTabViewModel,HomeTabStates>(
                    bloc: HomeTabViewModel.get(context),
                    builder: (BuildContext context, HomeTabStates state) {
                      if (state is HomeTabChangeWallpaperState) {
                        return
                          Opacity(
                            opacity: 0.4,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: HomeTabViewModel.get(context).chosenWallpaper!,
                              placeholder: (context, url) =>
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.PrimaryColor,
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Icon(
                                    Icons.error,
                                    color: AppColors.PrimaryColor,
                                  ),
                            ),
                          );
                      }
                      return Opacity(
                        opacity: 0.4,
                        child: CachedNetworkImage(

                          fit: BoxFit.fill,
                          imageUrl: HomeTabViewModel
                              .get(context)
                              .chosenWallpaper!,
                          placeholder: (context, url) =>
                              Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.PrimaryColor,
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                              Icon(
                                Icons.error,
                                color: AppColors.PrimaryColor,
                              ),
                        ),
                      );
                    } ),
            
            
            
                    Column(children: [SizedBox(height: height*0.03,),
                      Image.asset('assets/images/Available Now.png'),
                      SizedBox(height: height*0.02,),
                      CarouselSlider(
                        options: CarouselOptions(
            
                            onPageChanged: (index, reason) {
                            HomeTabViewModel.get(context).changeWallpaper(index);},
                            viewportFraction: 0.60,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                            initialPage: 2,
                            height: 300),
                        items: HomeTabViewModel.get(context).moviesList?.map((Movie) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(onTap: () { Navigator.pushNamed(context, MovieDetails.routeName,arguments: Movie);
                                HomeTabViewModel.get(context).saveHiveList(Movie);
                                },
                                  child: MoviesListview(item:Movie));
            
            
                            },
                          );
                        }).toList(),
                      ),
                      Image.asset('assets/images/Watch Now.png')
            
                    ],)
                  ],
                ),
                SizedBox(height: height*0.01,),
                MoviesListViewer(moviesList: HomeTabViewModel.get(context).romanceList!, movieType: AppLocalizations.of(context)!.romance),
                SizedBox(height: height*0.01,),
                MoviesListViewer(moviesList: HomeTabViewModel.get(context).actionList!, movieType: AppLocalizations.of(context)!.action),
                SizedBox(height: height*0.01,),
                MoviesListViewer(moviesList: HomeTabViewModel.get(context).scienceFictionList!, movieType: AppLocalizations.of(context)!.sciFic),
                SizedBox(height: height*0.01,),
                MoviesListViewer(moviesList: HomeTabViewModel.get(context).dramaList!, movieType: AppLocalizations.of(context)!.drama),
                SizedBox(height: height*0.01,),
                MoviesListViewer(moviesList: HomeTabViewModel.get(context).comedyList!, movieType: AppLocalizations.of(context)!.comedy),
                SizedBox(height: height*0.01,),
              ],
            ),
          ),
        );}

      } );
  }
}
