import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';
import 'package:movies_app1/reusable_widget/customTextField.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/changeAvatarsProviders.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../screen_details/AvatarsBottomSheet.dart';


class UpdateProfile extends StatefulWidget {
static const String routeName= 'Update_profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    var avatarProvider = Provider.of<ChangeAvatarProviders>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return
      Scaffold(
          resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.BlackColor,
        appBar:AppBar(centerTitle: true,backgroundColor: AppColors.BlackColor,
          title: Text('Pick Avatar',style: FontTheme.regular16Primary,),
          iconTheme: IconThemeData(color: AppColors.PrimaryColor),
        ) ,
        body:
          Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*0.02,),
          Center(
            child: InkWell(
              onTap: () {
      showAvatarsBottomSheet(context: context);
      setState(() {
      });
              },
              child: Container(
                height: height*0.17,
                decoration: BoxDecoration(color: AppColors.Transpernt,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(avatarProvider.oldAvatar,fit: BoxFit.fill,),),
            )
          ),
          SizedBox(height: height*0.04,),
          CustomTextField(cursorColor: AppColors.WhiteColor,
            prefixIcon:ImageIcon(color: AppColors.WhiteColor,AssetImage('assets/images/profile_logo.png')) ,
            fillColor: AppColors.PrimaryDark, hintText: 'Full Name',hintStyle: FontTheme.regular14White,),
          SizedBox(height: height*0.04,),
          CustomTextField(cursorColor: AppColors.WhiteColor,prefixIcon:ImageIcon(color: AppColors.WhiteColor,
              AssetImage('assets/images/phone_logo.png')),
              fillColor: AppColors.PrimaryDark,
          hintText: 'Phone Number',hintStyle: FontTheme.regular14White,),
          SizedBox(height: height*0.04,),
          Text('Reset Password',style: FontTheme.regular20White,),
          Spacer(),
          CustomElevatedButton(
              textStyle: FontTheme.regular20White, backgroundColor: AppColors.RedColor, text: 'Delete Account'),
          SizedBox(height: height*0.02,),
          CustomElevatedButton(textStyle: FontTheme.regular20Black, backgroundColor: AppColors.PrimaryColor, text: 'Update Data'),
          SizedBox(height: height*0.04,),
        ],
      ),
          )

      )
      ;
  }

  void showAvatarsBottomSheet({
    required BuildContext context}){
    showModalBottomSheet(
        backgroundColor: AppColors.Transpernt,
        context: context,
        builder: (context)=>AvatarsBottomSheet());

  }
}
