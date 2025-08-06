import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';
import '../domain/entities/MoviesListEntity.dart';
import '../features/home_screen/tabs/home_tab/homeTabViewModel.dart';
import '../features/screens/MovieDetails/MovieDetails.dart';

class MovieslistviewerScreenDetails extends StatelessWidget {
  MoviesEntity item;
MovieslistviewerScreenDetails({required this.item});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  InkWell(onTap: (){ Navigator.pushNamed(context, MovieDetails.routeName,arguments: item);
    HomeTabViewModel.get(context).saveHiveList(item);},
      child: Container(margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
        child: Stack(
          children: [ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: width*0.3,
              height: height*0.5,
              imageUrl: item.largeCoverImage!,
              placeholder: (context, url) =>  Center(
                child: CircularProgressIndicator(
                  color: AppColors.PrimaryColor,
                ),
              ),
              errorWidget: (context, url, error) =>  Icon(
                Icons.error,
                color: AppColors.PrimaryColor,
              ),
            ),
          ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: height*0.01,vertical: width*0.02),
              width: 50,
              decoration: BoxDecoration(
                  color: AppColors.BlackTransperntColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(item.rating.toString(),style: TextStyle(color: AppColors.WhiteColor),),
                  Image.asset('assets/images/star 1.png'),
                ],
              ),
            )
          ],
        ),
      ),
    ); ;
  }
}
