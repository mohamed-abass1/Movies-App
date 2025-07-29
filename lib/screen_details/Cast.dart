import 'package:flutter/cupertino.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';

class Cast extends StatelessWidget {
String image;
String name;
String Character;
Cast({required this.name,required this.Character,required this.image});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding:EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.01) ,
        margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.005),
      height: height*0.1,width: width*0.1,
      decoration: BoxDecoration(color: AppColors.primeGray,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Image.asset(image),
      SizedBox(width: width*0.03,),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name,style:FontTheme.regular20White,),
          Text(Character,style:FontTheme.regular20White),
        ],
      ),Spacer()
      ],)
      ,);
  }
}
