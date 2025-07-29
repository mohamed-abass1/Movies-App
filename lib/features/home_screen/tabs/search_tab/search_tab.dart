import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/MovieSearchStates.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/MovieSearchViewModel.dart';
import 'package:movies_app1/reusable_widget/customTextField.dart';

import '../../../../screen_details/moviesSlider.dart';

class SearchTab extends StatelessWidget {
MovieSearchViewModel viewModel =getIt<MovieSearchViewModel>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      Scaffold(backgroundColor: AppColors.BlackColor,
      body: Container(padding: EdgeInsets.symmetric(vertical: height*0.04,horizontal: width*0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(fillColor: AppColors.primeGray,onTap:() => viewModel.getMovieSearch() ,
            prefixIcon:
            InkWell(onTap: () => viewModel.getMovieSearch(),
              child: ImageIcon(AssetImage('assets/images/search_unselected_icon.png'),
                color: AppColors.WhiteColor,),
            ),
          hintText: 'Search',
            hintStyle: FontTheme.semi16white,
            controller: viewModel.Search,
          ),
          BlocBuilder<MovieSearchViewModel,MovieSearchStates>(
            bloc: viewModel..getMovieSearch(),
            builder:(context, state) {
              if (state is MovieSearchSuccessState) {
                return
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: height * 0.001,
                        crossAxisSpacing: width * 0.01,
                        crossAxisCount: 2,),
                      itemCount: viewModel.moviesSearch.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MoviesSlider(
                          item: viewModel.moviesSearch[index],);
                      },
                    ),
                  );
              }
              else if (state is MovieSearchDownloadState) {
                return Center(child: CircularProgressIndicator(
                  color: AppColors.PrimaryColor,));
              }

              else if (state is MovieSearchErrorState) {
               return Center(child: Text(state.error.errorMessage,style: FontTheme.bold18Primary,),);}

              else {return CircularProgressIndicator(color: AppColors.PrimaryDark);}
            } ),
          ],),
      ),);
  }
}
