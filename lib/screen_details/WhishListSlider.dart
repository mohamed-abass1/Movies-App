
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/domain/entities/GetAllFavouriteResponseEntity.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/font_theme.dart';
import '../features/screens/MovieDetails/MovieDetails.dart';

class WhichListSlider extends StatelessWidget {
  GetAllFavouriteDataEntity item;
  WhichListSlider({required this.item});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(margin: EdgeInsets.only(right: width*0.02,left: width*0.02,bottom: height*0.002),
      child: Stack(
        children: [ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
          child:CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: item.imageURL??'',
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
        ),
          Container(
            height: height*0.04,
            margin: EdgeInsets.symmetric(horizontal: height*0.01,vertical: width*0.02),
            width: width*0.14,
            decoration: BoxDecoration(
                color: AppColors.BlackTransperntColor,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(item.rating.toString()??'',style: FontTheme.regular16White,),
                Image.asset('assets/images/star 1.png'),
              ],
            ),
          )
        ],
      ),
    ); ;
  }
}