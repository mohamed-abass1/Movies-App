import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/core/validator.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/login_screen.dart';
import 'package:movies_app1/features/auth/register_screen/RegisterStates.dart';
import 'package:movies_app1/features/auth/register_screen/RegisterViewModel.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';
import 'package:movies_app1/reusable_widget/customTextField.dart';

import '../../../core/DialogeUtils.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName='register';
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterViewModel,RegisterTabStates>(
      bloc: viewModel,
      listener: (BuildContext context, RegisterTabStates state)
      {  if (state is RegisterDownloadState) {
      DialogUtils.showLoading(context: context, message: 'Loading...');
    } else if (state is RegisterTabErrorState) {
        print(state.error.errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: state.error.errorMessage,
          title: 'Error',
          posActionName: 'OK');
    } else if (state is RegisterSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: 'Register Successfully',
          title: 'Success',
          posActionName: 'OK');
    }},
      builder:(context, state) =>  Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text(

              'Register', style: TextStyle(color: AppColors.PrimaryColor),),
          backgroundColor: AppColors.PrimaryDark,
          iconTheme: IconThemeData(color: AppColors.PrimaryColor),
        ),
        body:
          Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Container(height: height*0.15,
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.symmetric(vertical: height*0.02),
                  child: CarouselSlider(
                      options: CarouselOptions(
                  viewportFraction: 0.33,
                  enlargeFactor: 0.6,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) => viewModel.avatar=index,
                  initialPage: 1,
                  height: 300.0),
                      items: viewModel.avatars.map((i) {

                      return Builder(
                      builder: (BuildContext context) {
                      return Container(
                      decoration: BoxDecoration(
                      ),
                      child: InkWell(child: Image.asset(i,fit: BoxFit.contain,),onTap: () {

                      viewModel.selectedAvatar=i;print(viewModel.selectedAvatar);})
                      );
                      },
                      );
                      }).toList(),
                      ),
                ),
                Center(child: Text('Avatars',style: TextStyle(color:AppColors.WhiteColor),),),

                CustomTextField(
                  controller:viewModel.NameController ,
                  validator: AppValidators.validateUsername,
                  fillColor: AppColors.PrimaryDark,
                  prefixIcon:ImageIcon(AssetImage('assets/images/Name Icon.png'),
                    color: AppColors.WhiteColor,),hintText:'Name',),
                SizedBox(height: height*0.02,),
                CustomTextField( fillColor: AppColors.PrimaryDark,
                  controller:viewModel.EmailController ,
                  validator: AppValidators.validateEmail,
                  prefixIcon:ImageIcon(AssetImage('assets/images/email_icon.png'),color: AppColors.WhiteColor),hintText:'Email',),
                SizedBox(height: height*0.02,),

                CustomTextField(fillColor: AppColors.PrimaryDark,
                  controller:viewModel.password1Controller ,
                  validator: AppValidators.validatePassword,
                  obscure: viewModel.passwordObscureText,
                  prefixIcon:ImageIcon(AssetImage('assets/images/lock_icon.png'),color: AppColors.WhiteColor),hintText:'Password',
                  suffixIcon:viewModel.passwordObscureText==true? InkWell(
                    onTap:() {viewModel.unObscurePassword();},
                    child: ImageIcon(color: AppColors.WhiteColor,
                        AssetImage('assets/images/show_pass_icon.png') ),
                  ):
                  InkWell(onTap: () => viewModel.ObscurePassword(),
                      child: Icon(Icons.remove_red_eye_rounded,color: AppColors.WhiteColor,))
                ),
                  SizedBox(height: height*0.02,),

                CustomTextField(fillColor: AppColors.PrimaryDark,
                  obscure: viewModel.RepasswordObscureText,
                  controller:viewModel.rePassword1Controller ,
                  validator: AppValidators.validatePassword,
                  prefixIcon:ImageIcon(AssetImage('assets/images/lock_icon.png'),color: AppColors.WhiteColor),hintText:'Confirm Password',
                  suffixIcon: viewModel.RepasswordObscureText==true? InkWell(
                    onTap:() {viewModel.unObscureRePassword();},
                    child: ImageIcon(color: AppColors.WhiteColor,
                        AssetImage('assets/images/show_pass_icon.png') ),
                  ):
                  InkWell(onTap: () => viewModel.ObscureRePassword(),
                      child: Icon(Icons.remove_red_eye_rounded,color: AppColors.WhiteColor,))),

                  SizedBox(height: height*0.02,),

                CustomTextField(fillColor: AppColors.PrimaryDark,
                  controller:viewModel.phoneNumController ,
                  prefixIcon:ImageIcon(AssetImage('assets/images/phone_logo.png'),color: AppColors.WhiteColor),hintText:'Phone Number',),

                SizedBox(height: height*0.02,),
                CustomElevatedButton(
                  onTab: () => viewModel..register(),
                    textStyle: FontTheme.regular20Black, backgroundColor: AppColors.PrimaryColor, text: 'Create Account'),
                SizedBox(height: height*0.02,),
                InkWell(onTap: () => Navigator.pushNamed(context, LoginScreen.initialRoute),
                  child: RichText(textAlign: TextAlign.center,

                    text: TextSpan(children:<TextSpan>[
                      TextSpan(text: 'Already Have Account? ',style: FontTheme.regular16White),
                      TextSpan(text: 'LogIn',style: FontTheme.regular16Primary,),
                    ] ),),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
