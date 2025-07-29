import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInStates.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInViewModel.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';

import '../../../core/DialogeUtils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../reusable_widget/customElevatedButton.dart';
import '../../../reusable_widget/customTextField.dart';

class LoginScreen extends StatelessWidget {
static String initialRoute='Login Screen';
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    LogInViewModel viewModel =getIt<LogInViewModel>();
    return
    BlocListener<LogInViewModel,LogInTabStates>(
      bloc:viewModel ,
      listener: (BuildContext context, LogInTabStates state) {  if (state is LogInDownloadState) {
      DialogUtils.showLoading(context: context, message: 'Loading...');
    } else if (state is LogInTabErrorState) {
      print(state.error.errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: state.error.errorMessage,
          title: 'Error',
          posActionName: 'OK');
    } else if (state is LogInSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: 'Register Successfully',
          title: 'Success',
          posAction:() =>Navigator.pushNamed(context, HomeScreen.routeName),
          posActionName: 'OK');
    }},
      child: Form(
        key: viewModel.formKey,
        child: Scaffold(
           body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
         Image.asset('assets/images/APP_LOGO.png',height: height*0.35,),
         CustomTextField(fillColor: AppColors.PrimaryDark,hintText: 'Email',hintStyle: FontTheme.regular16White,
           controller: viewModel.EmailController,
           prefixIcon:ImageIcon(color: AppColors.WhiteColor,
               AssetImage('assets/images/email_icon.png') ),),
         SizedBox(height: height*0.04,),
         CustomTextField(fillColor: AppColors.PrimaryDark,hintText: 'Password',hintStyle: FontTheme.regular16White,
           controller: viewModel.password1Controller,
           prefixIcon:ImageIcon(color: AppColors.WhiteColor,
               AssetImage('assets/images/lock_icon.png') ),
         suffixIcon: ImageIcon(color: AppColors.WhiteColor,
             AssetImage('assets/images/show_pass_icon.png') ),),
           SizedBox(height: height*0.02,),

        Text('Forget Password',style: FontTheme.regular16Primary,textAlign: TextAlign.right,),
           SizedBox(height: height*0.02,),
           CustomElevatedButton(onTab: () => viewModel.LogIn(),
               textStyle: FontTheme.regular20Black, backgroundColor: AppColors.PrimaryColor, text: 'login'),
           SizedBox(height: height*0.02,),
        RichText(textAlign: TextAlign.center,
          text: TextSpan(children:<TextSpan>[
          TextSpan(text: 'Don`t have account? ',style: FontTheme.regular16White),
          TextSpan(text: 'Create one',style: FontTheme.regular16Primary),
        ] ),),
           Row(children: [
             Expanded(child: Divider(endIndent: 4,indent: 4,thickness:3,color: AppColors.PrimaryColor))
             ,Text('OR',style: FontTheme.regular16Primary,),
             Expanded(child: Divider(endIndent: 4,indent: 4,thickness:3,color: AppColors.PrimaryColor)),],)
           ],),
        ),
      ),
    )
      ;
  }
}
