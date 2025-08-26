import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/home_screen/tabs/browse_tab/BrowseTabStates.dart';
import 'package:movies_app1/features/home_screen/tabs/browse_tab/BrowseTabViewModel.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/homeTabViewModel.dart';
import 'package:movies_app1/screen_details/moviesSlider.dart';

class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}
BrowseTabViewModel viewModel=getIt<BrowseTabViewModel>();
class _BrowseTabState extends State<BrowseTab> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: viewModel.tabs.length,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.Transpernt,
                bottom: TabBar(
                  indicator: BoxDecoration(),
                  labelPadding: EdgeInsets.symmetric(horizontal:width*0.012),
                  dividerColor: AppColors.Transpernt,
                  indicatorColor:AppColors.PrimaryColor,
                   onTap: (value) {
                    viewModel.selectedIndex=value;
                    viewModel.selectedTab=viewModel.tabs[value]
                    ;
                    setState(() {

                    });},
                  padding: EdgeInsets.all(0),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: viewModel.tabs.map((tab) =>
                      Container(
                        margin:EdgeInsets.symmetric(vertical: width*0.03),
                        padding:
                        EdgeInsets.symmetric(horizontal:width*0.035),
                      height: 50,
                          decoration:
                          BoxDecoration(
                              border: Border.all(color: AppColors.PrimaryColor,width: 3),
                              color:tab==viewModel.selectedTab? AppColors.PrimaryColor:AppColors.Transpernt,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Tab(child: Text(tab,style:tab==viewModel.selectedTab? FontTheme.bold20Dark:FontTheme.bold20Primary,),)))
                      .toList(),
                )),
          body: BlocBuilder<BrowseTabViewModel,BrowseTabStates>(
            bloc: viewModel..get50MoviesList(),
            builder:(context, state) {
              if(state is BrowseTabSuccessState) {return
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: height * 0.001,
                    crossAxisSpacing: width * 0.01,
                    crossAxisCount: 2,),
                  itemCount: viewModel.movies50List!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => HomeTabViewModel.get(context).saveHiveList(viewModel.movies50List![index]),
                      child: MoviesSlider(
                        item: viewModel.movies50List![index]),
                    );
                  },
                );
              }
              if(state is BrowseTabErrorState){return Center(child: Text(state.error.errorMessage,style: FontTheme.bold18Primary,),);}
            else{
              return Center(child: CircularProgressIndicator(color: AppColors.PrimaryColor,));}}

          )
        ));

  }
}
