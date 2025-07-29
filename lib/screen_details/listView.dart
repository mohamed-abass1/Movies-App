import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/core/utils/app_colors.dart';

import '../domain/entities/MoviesListEntity.dart';

class MoviesListview extends StatelessWidget {
  MoviesEntity item;
  MoviesListview({required this.item});

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      Stack(
      children: [ClipRRect(borderRadius: BorderRadius.all(Radius.circular(16)),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          width: width*0.5,
        height: height*1.5,
        imageUrl: item.mediumCoverImage!,
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
    );
  }
}
