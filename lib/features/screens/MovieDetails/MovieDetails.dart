import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetailsStates.dart';
import 'package:movies_app1/features/screens/MovieDetails/MovieDetailsViewModel.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';
import 'package:movies_app1/screen_details/Cast.dart';
import 'package:movies_app1/screen_details/moviesSlider.dart';

import '../../../core/DialogeUtils.dart';

class MovieDetails extends StatefulWidget {
  static String routeName='movieDetails';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieDetailsViewModel viewModel =getIt<MovieDetailsViewModel>();

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MoviesEntity;
    List<String>cast=['assets/images/cast.png',
      'assets/images/cast2.png',
      'assets/images/cast4.png'];
    List<String>character=
    ['Character : Captain Carter',
      'Character : Christine Palmer',
      'Character : Clea'];
    List<String>name=['Name : Hayley Atwell',
      'Name : Rachel McAdams ',
      'Name : Hayley Atwell'];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(args.id);
    return BlocConsumer<MovieDetailsViewModel,MovieDetailsStates>(

      bloc: viewModel..getMovieDetails('${args.id}')..getMovieSuggest('${args.id}')..isFavourite('${args.id}'),
      builder: (context, state) {
        if (state is MovieDetailsSuccessState||state is MovieSuggestSuccessState||state is IsFavouriteSuccessState||state is RemoveFavouriteSuccessState){return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: viewModel.movieDetails.largeCoverImage??'',
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
                      ),),
                    SizedBox(height: height*0.75,
                      child: Container(margin: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.05),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(onTap:() => Navigator.pushNamed(context, HomeScreen.routeName) ,
                                    child: Icon(Icons.arrow_back_ios_new, color: AppColors.WhiteColor,size: height*0.04,)),
                                viewModel.favouriteMessage==false ?
                                InkWell(onTap: () => viewModel.addMovieToFavourite(args.largeCoverImage??'','${ args.year??''}', '${args.id??''}',args.rating?.toInt()??1, args.title??''),
                                 child:  ImageIcon( AssetImage('assets/images/save_flag.png'), color: AppColors.WhiteColor)
                                ):
                                //todo:remove favourite
                                InkWell(onTap: () => viewModel.removeFavourite('${args.id}'),
                                    child:  ImageIcon( AssetImage('assets/images/save_flag.png'), color: AppColors.PrimaryColor)
                                )
                              ],
                            ),
                            Image.asset('assets/images/watch_ICON.png'),
                            Container(color: Colors.transparent,
                              child: SizedBox(height: height*0.117,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(textAlign: TextAlign.center,args.slug??'',style: FontTheme.bold24White,),
                                    Text(viewModel.movieDetails.year.toString(),style: FontTheme.bold20Gray,textAlign: TextAlign.center,)
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(margin: EdgeInsets.symmetric(horizontal: width*0.03),
                    child: CustomElevatedButton(textStyle: FontTheme.semi20White, backgroundColor: AppColors.RedColor, text: 'Watch')),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: height*0.05,width: width*0.26,
                      margin: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
                      decoration: BoxDecoration(color: AppColors.primeGray,borderRadius: BorderRadius.all(Radius.circular(16))),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/heart_icon.png',height: height*0.025,),
                          SizedBox(width: width*0.002,),
                          Text(viewModel.movieDetails.likeCount.toString(),style: FontTheme.bold24White,)
                        ],) ,
                    ),
                    Container(height: height*0.05,width: width*0.26,
                      margin: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
                      decoration: BoxDecoration(color: AppColors.primeGray,borderRadius: BorderRadius.all(Radius.circular(16))),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/time_icon.png',height: height*0.025,),
                          SizedBox(width: width*0.002,),
                          Text(viewModel.movieDetails.runtime.toString(),style: FontTheme.bold24White,)
                        ],) ,
                    ),
                    Container(height: height*0.05,width: width*0.26,
                      margin: EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.02),
                      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.02),
                      decoration: BoxDecoration(color: AppColors.primeGray,borderRadius: BorderRadius.all(Radius.circular(16))),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/star_icon.png',height: height*0.025,),
                          SizedBox(width: width*0.002,),
                          Text(viewModel.movieDetails.rating.toString(),style: FontTheme.bold24White,)
                        ],) ,
                    ),



                  ],),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text('Screen Shots',style: FontTheme.bold24White,textAlign: TextAlign.start,)),
                SizedBox(height: height*0.02,),
                Container(margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
                      child:  CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: 'https://yts.mx/assets/images/movies/13_2010/background.jpg',
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
                      ),)),
                SizedBox(height: height*0.02,),
                Container(margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
                      child:  CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:'https://yts.mx/assets/images/movies/13_Eerie_2013/background.jpg',
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
                      ),)),
                SizedBox(height: height*0.02,),
                Container(margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
                      child:  CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: viewModel.movieDetails.backgroundImage??'',
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
                      ),)),
                SizedBox(height: height*0.02,),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text('Similar',style: FontTheme.bold24White,textAlign: TextAlign.start,)),
                GridView.builder(
                  shrinkWrap: true,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: height*0.001,
                    crossAxisSpacing: width*0.01,
                    crossAxisCount: 2,),
                  itemCount: viewModel.moviesSuggest.length,
                  itemBuilder: (BuildContext context, int index) { return MoviesSlider(item: viewModel.moviesSuggest[index],);  },
                ),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text('Summary',style: FontTheme.bold24White,textAlign: TextAlign.start,)),
                SizedBox(height: height*0.02,),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child:  Text(style: FontTheme.regular16White
                      , "In Talbot, Ohio, a fathers need for surgeries puts the family in a financial bind. His son Vince, an electrician, overhears a man talking about making a fortune in just a day. When the man overdoses on drugs, Vince finds instructions and a cell phone that the man has received and substitutes himself: taking a train to New York and awaiting contact. He has no idea what its about. He ends up at a remote house where wealthy men bet on who will survive a complicated game of Russian roulette: he's number 13. In flashbacks we meet other contestants, including a man whose brother takes him out of a mental institution in order to compete. Can Vince be the last one standing?" ,textAlign: TextAlign.start,)),
                SizedBox(height: height*0.01,),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text('Cast',style: FontTheme.bold24White,textAlign: TextAlign.start,)),
                ListView.builder(itemCount: cast.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return
                      Cast(Character: character[index],name: name[index],image: cast[index],);
                  },),
                Container(
                    margin:  EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text('Genres',style: FontTheme.bold24White,textAlign: TextAlign.start,)),
                Container(padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio:5/1.5,
                      crossAxisSpacing:15 ,
                      mainAxisSpacing: 15,
                      crossAxisCount: 3,),
                    itemCount: viewModel.movieDetails.genres?.length??0,
                    itemBuilder: (BuildContext context, int index) { return
                      Container(
                        padding: EdgeInsets.symmetric(vertical: height*0.007),
                        decoration: BoxDecoration(
                            color: AppColors.primeGray,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),child: Text(viewModel.movieDetails.genres![index],style: FontTheme.regular16White,textAlign: TextAlign.center,),
                      )
                    ; },
                  ),
                ),





              ],
            ),
          ),
        );}
        if(state is MovieDetailsErrorState){return Center(child: Text(state.error.errorMessage,style: FontTheme.bold18Primary,),);}
        return Center(child: Center(child: CircularProgressIndicator(color: AppColors.PrimaryColor,)));
      }, listener: (BuildContext context, MovieDetailsStates state) {
   if (state is AddToFavoriteErrorState) {
      print(state.error.errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: state.error.errorMessage,
          title: 'Error',
          posActionName: 'OK');
    } else if (state is AddToFavoriteSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: 'Added Successfully',
          title: 'Success',
          posActionName: 'OK');
    } if (state is RemoveFavouriteSuccessState) {
     DialogUtils.hideLoading(context);
     DialogUtils.showMessage(
         context: context,
         message: 'Removed Successfully',
         title: 'Success',
         posActionName: 'OK');
   }},

    );
  }
}
