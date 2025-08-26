import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInStates.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInViewModel.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';

import '../../../core/DialogeUtils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../core/validator.dart';
import '../../../reusable_widget/customElevatedButton.dart';
import '../../../reusable_widget/customTextField.dart';
import 'ResetPasswordStates.dart';
import 'ResetPasswordViewModel.dart';

class ResetPassword extends StatelessWidget {
static String initialRoute='Reset_password';
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    ResetPasswordViewModel viewModel =getIt<ResetPasswordViewModel>();
    return
    BlocConsumer<ResetPasswordViewModel,ResetPasswordTabStates>(
      bloc:viewModel ,
      listener: (BuildContext context,ResetPasswordTabStates state) {  if (state is ResetPasswordDownloadState) {
      DialogUtils.showLoading(context: context, message: 'Loading...');
    } else if (state is ResetPasswordTabErrorState) {
      print(state.error.errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: state.error.errorMessage,
          title: 'Error',
          posActionName: 'OK');
    } else if (state is ResetPasswordSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
          context: context,
          message: 'Reset Password  Successfully',
          title: 'Success',
          posAction:() =>Navigator.pushNamed(context, HomeScreen.routeName),
          posActionName: 'OK');
    }},
      builder: (context, state) => Form(
        key: viewModel.formKey,
        child: Scaffold(
           body: Container(padding: EdgeInsets.all(15),
             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Image.asset('assets/images/APP_LOGO.png',height: height*0.35,),
             CustomTextField(fillColor: AppColors.PrimaryDark,
                 obscure: viewModel.OldPasswordObscureText,
                 controller:viewModel.oldPasswordController,
                 validator: AppValidators.validatePassword,
                 prefixIcon:ImageIcon(AssetImage('assets/images/lock_icon.png'),color: AppColors.WhiteColor),hintText:'Old Password',
                 suffixIcon: viewModel.OldPasswordObscureText==true? InkWell(
                   onTap:() {viewModel.unObscureOldPassword();},
                   child: ImageIcon(color: AppColors.WhiteColor,
                       AssetImage('assets/images/show_pass_icon.png') ),
                 ):
                 InkWell(onTap: () => viewModel.ObscurOldPassword(),
                     child: Icon(Icons.remove_red_eye_rounded,color: AppColors.WhiteColor,))),

                      SizedBox(height: height*0.04,),
                        CustomTextField(fillColor: AppColors.PrimaryDark,
                            obscure: viewModel.NewPasswordObscureText,
                            controller:viewModel.NewPassword1Controller,
                            validator: AppValidators.validatePassword,
                            prefixIcon:ImageIcon(AssetImage('assets/images/lock_icon.png'),color: AppColors.WhiteColor),hintText:'New Password',
                            suffixIcon: viewModel.NewPasswordObscureText==true? InkWell(
                              onTap:() {viewModel.unObscureNewPassword();},
                              child: ImageIcon(color: AppColors.WhiteColor,
                                  AssetImage('assets/images/show_pass_icon.png') ),
                            ):
                            InkWell(onTap: () => viewModel.ObscureNewPassword(),
                                child: Icon(Icons.remove_red_eye_rounded,color: AppColors.WhiteColor,))),

                        SizedBox(height: height*0.02,),
             CustomElevatedButton(onTab: () => viewModel.ResetPassword(),
                 textStyle: FontTheme.regular20Black, backgroundColor: AppColors.PrimaryColor, text: 'Reset'),
             SizedBox(height: height*0.02,),
             InkWell(onTap: () =>Navigator.pushNamed(context, HomeScreen.routeName) ,
                 child: Text('Back To Home Screen',style: FontTheme.regular16Primary,textAlign: TextAlign.right,)),
             ],),
           ),
        ),
      ),
    )
      ;
  }
}
