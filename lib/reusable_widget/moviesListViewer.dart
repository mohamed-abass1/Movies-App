import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/domain/entities/MoviesListEntity.dart';
import 'package:movies_app1/screen_details/moviesListViewerScreenDetails.dart';

class Movieslistviewer extends StatelessWidget {
List<MoviesEntity>moviesList;
String movieType;

Movieslistviewer({required this.moviesList,required this.movieType});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween
          ,children: [Text(movieType,style: FontTheme.regular14White,),Row(
            children: [
              Text('See More',style: FontTheme.regular16Primary,),
              SizedBox(width: width*0.005,),
              Icon(Icons.arrow_forward_rounded,color: AppColors.PrimaryColor,size: height*0.015,)
            ],
          )],),
        SizedBox(height: 200,
          child: ListView.builder(itemCount:moviesList.length,scrollDirection: Axis.horizontal ,
            itemBuilder: (context, index) {
            return MovieslistviewerScreenDetails(item: moviesList[index],);

          },),
        ),
      ],
    );
  }
}
