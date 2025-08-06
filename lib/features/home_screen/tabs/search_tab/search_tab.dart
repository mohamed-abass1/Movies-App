import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/home_tab.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/MovieSearchStates.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/MovieSearchViewModel.dart';
import 'package:movies_app1/reusable_widget/customTextField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../screen_details/moviesSlider.dart';

class SearchTab extends StatelessWidget {
  MovieSearchViewModel viewModel = getIt<MovieSearchViewModel>();
  static String route = 'search';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      viewModel.Search.text = args;
    }

    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.04, horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              fillColor: AppColors.primeGray,
              onTap: () => viewModel.getMovieSearch(viewModel.Search.text),
              prefixIcon: InkWell(
                onTap: () => viewModel.getMovieSearch(viewModel.Search.text),
                child: ImageIcon(
                  AssetImage('assets/images/search_unselected_icon.png'),
                  color: AppColors.WhiteColor,
                ),
              ),
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: FontTheme.semi16white,
              controller: viewModel.Search,
            ),
            Expanded(
              child: Stack(alignment: Alignment.bottomLeft, children: [
                BlocBuilder<MovieSearchViewModel, MovieSearchStates>(
                    bloc: viewModel
                      ..getMovieSearch(args ?? viewModel.Search.text),
                    builder: (context, state) {
                      if (state is MovieSearchSuccessState) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: height * 0.001,
                            crossAxisSpacing: width * 0.01,
                            crossAxisCount: 2,
                          ),
                          itemCount: viewModel.moviesSearch.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MoviesSlider(
                              item: viewModel.moviesSearch[index],
                            );
                          },
                        );
                      } else if (state is MovieSearchDownloadState) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.PrimaryColor,
                        ));
                      } else if (state is MovieSearchErrorState) {
                        return Center(
                          child: Text(
                            state.error.errorMessage,
                            style: FontTheme.bold18Primary,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator(
                            color: AppColors.PrimaryDark);
                      }
                    }),
                if (args != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 25),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.BlackColor,
                      ),
                      backgroundColor: AppColors.TransperntPrimaryColor,
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: AppColors.BlackColor, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(26))),
                    ),
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
