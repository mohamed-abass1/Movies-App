import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/cache/sha-pref.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/login_screen.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/ProfileTabViewModel.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/profileTabStates.dart';
import 'package:movies_app1/features/screens/update_profile/update_profile.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';
import 'package:movies_app1/screen_details/WhishListSlider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../screen_details/moviesSlider.dart';

class ProfileTab extends StatefulWidget {

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
String wishOrHist='Wish List';
ProfileTabViewModel viewModel=getIt<ProfileTabViewModel>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileTabViewModel,ProfileTabStates>(
      bloc: viewModel..getFavouriteMoviesList()..getHiveList()..getProfile(),
      builder: (context, state) {
        if (state is ProfileTabDownloadState){
          return Center(child: CircularProgressIndicator(color: AppColors.PrimaryColor,));}
        if (state is ProfileTabErrorState){
          return Center(child: Text(state.error.errorMessage,style: FontTheme.bold20Primary,));}
        else{return
        Scaffold(
          backgroundColor: AppColors.BlackColor,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: height * 0.06, left: width * 0.03, right: width * 0.03),
                height: height * 0.455,
                color: AppColors.PrimaryDark,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            viewModel.avatar==null?
                                Center(child: CircularProgressIndicator(color: AppColors.PrimaryColor,)):
                            Image.asset(
                              'assets/images/avatar${viewModel.avatar}.png',
                              height: height * 0.14,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),

                            Text(
                              viewModel.name??'name',
                              style: FontTheme.bold20White,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Text(
                             ' ${viewModel.moviesFavouriteList?.length.toInt()}',
                              style: FontTheme.bold36White,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              AppLocalizations.of(context)!.wishList,
                              style: FontTheme.bold24White,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Text(
                              '${viewModel.historyList.length}',
                              style: FontTheme.bold36White,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Text(
                              AppLocalizations.of(context)!.history,
                              style: FontTheme.bold24White,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: width * 0.6,
                          child:CustomElevatedButton(backgroundColor: AppColors.PrimaryColor,
                              textStyle: FontTheme.regular20Black,
                              text: AppLocalizations.of(context)!.editProfile,
                          onTab: () => Navigator.pushNamed(context, UpdateProfile.routeName),)
                        ),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.065,
                          child: CustomElevatedButton(
                            onTab: () {SharedPreferenceUtils.removeData(key: 'token');
                              Navigator.pushNamed(context, LoginScreen.initialRoute);},
                              textStyle: FontTheme.semi16white,
                              backgroundColor: AppColors.RedColor,
                              text: AppLocalizations.of(context)!.exit),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(onTap: () {
                          wishOrHist='Wish List';
                          setState(() {

                          });
                        },
                          child: Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:wishOrHist=='Wish List'? AppColors.PrimaryColor:AppColors.Transpernt,
                                        width: height * 0.005))),
                            child: Column(
                              children: [
                                Icon(
                                  CupertinoIcons.list_bullet,
                                  size: height * 0.05,
                                  color: AppColors.PrimaryColor,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.wishList,
                                  style: FontTheme.regular20White,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            wishOrHist='History';
                            setState(() {

                            });
                          },
                          child: Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: wishOrHist=='History'? AppColors.PrimaryColor:AppColors.Transpernt,
                                        width: height * 0.005))),
                            child: Column(
                              children: [
                                Icon(
                                  CupertinoIcons.folder_fill,
                                  size: height * 0.05,
                                  color: AppColors.PrimaryColor,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.history,
                                  style: FontTheme.regular20White,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(shrinkWrap:true ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: width * 0.01,
                    crossAxisCount: 3,),
                  itemCount: wishOrHist == 'History' ? viewModel.historyList.length:viewModel.moviesFavouriteList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      wishOrHist=='History'? MoviesSlider(
                        item:viewModel.historyList[index]
                    ):WhichListSlider(item: viewModel.moviesFavouriteList![index]);
                  },
                ),
              )
            ],
          ));}}
    );
  }
}
