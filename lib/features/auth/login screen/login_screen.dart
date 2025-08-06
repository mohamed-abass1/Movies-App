import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/providers/changeLanguageProvider.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInStates.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInViewModel.dart';
import 'package:movies_app1/features/auth/register_screen/register_screen.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/DialogeUtils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../reusable_widget/customElevatedButton.dart';
import '../../../reusable_widget/customTextField.dart';

class LoginScreen extends StatefulWidget {
static String initialRoute='Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    LogInViewModel viewModel =getIt<LogInViewModel>();
    return
    BlocConsumer<LogInViewModel,LogInTabStates>(
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
      builder: (context, state) =>
          Form(
        key: viewModel.formKey,
        child: Scaffold(
           body: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Image.asset('assets/images/APP_LOGO.png',height: height*0.35,),
                      CustomTextField(fillColor: AppColors.PrimaryDark,hintText: 'Email',hintStyle: FontTheme.regular16White,
             controller: viewModel.EmailController,
             prefixIcon:ImageIcon(color: AppColors.WhiteColor,
                 AssetImage('assets/images/email_icon.png') ),),
                      SizedBox(height: height*0.04,),
                      CustomTextField(obscure: viewModel.passwordObscureText,
                        fillColor: AppColors.PrimaryDark,hintText: 'Password',hintStyle: FontTheme.regular16White,
             controller: viewModel.password1Controller,
             prefixIcon:
             ImageIcon(color: AppColors.WhiteColor,
                 AssetImage('assets/images/lock_icon.png') ),
                        suffixIcon:
                        viewModel.passwordObscureText==false? InkWell(
                        onTap:() {viewModel.ObscurePassword();},
                        child: ImageIcon(color: AppColors.WhiteColor,
                                       AssetImage('assets/images/show_pass_icon.png') ),
                      ):
                        InkWell(onTap: () => viewModel.unObscurePassword(),
                            child: Icon(Icons.remove_red_eye_rounded,color: AppColors.WhiteColor,))

                        ,),
             SizedBox(height: height*0.02,),

                     Text('Forget Password',style: FontTheme.regular16Primary,textAlign: TextAlign.right,),
             SizedBox(height: height*0.02,),
             CustomElevatedButton(
                 onTab: () => viewModel.LogIn(),
                 textStyle: FontTheme.regular20Black, backgroundColor: AppColors.PrimaryColor, text: 'login'),
             SizedBox(height: height*0.02,),
                     InkWell(onTap: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                       child: RichText(textAlign: TextAlign.center,
              text: TextSpan(children:<TextSpan>[
              TextSpan(text: 'Don`t have account? ',style: FontTheme.regular16White),
              TextSpan(text: 'Create one',style: FontTheme.regular16Primary),
                       ] ),),
                     ), SizedBox(height: height*0.02,),

                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(width: 1.5,
                            color: AppColors.PrimaryColor)),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(onTap: () {
                                 Provider.of<ChangeLanguageProviders>(context,listen: false).ChangeLanguage('en');

                                },
                                  child: CircleAvatar(radius: 20,
                                    backgroundColor:Provider.of<ChangeLanguageProviders>(context).LanguageApp=='en'? AppColors.PrimaryColor:AppColors.Transpernt,
                                    child: Image.asset('assets/images/en.png'),),
                                ),
                                SizedBox(width: width*0.03,),
                                InkWell(onTap: () { Provider.of<ChangeLanguageProviders>(context,listen: false).ChangeLanguage('ar');},
                                  child: CircleAvatar(backgroundColor:Provider.of<ChangeLanguageProviders>(context).LanguageApp!='en'? AppColors.PrimaryColor:AppColors.Transpernt,
                                    radius: 20,
                                    child: Image.asset('assets/images/egy.png'),),
                                )
                              ]
                            ),),
                          ],
                        )
             ],),
           ),
        ),
      ),
    )
      ;
  }
}
