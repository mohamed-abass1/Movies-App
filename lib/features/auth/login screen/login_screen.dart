import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/core/providers/changeLanguageProvider.dart';
import 'package:movies_app1/core/validator.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInStates.dart';
import 'package:movies_app1/features/auth/login%20screen/LogInViewModel.dart';
import 'package:movies_app1/features/auth/register_screen/register_screen.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    LogInViewModel viewModel = getIt<LogInViewModel>();

    return BlocConsumer<LogInViewModel, LogInTabStates>(
      bloc: viewModel,
      listener: (BuildContext context, LogInTabStates state) {
        if (state is LogInDownloadState) {
          DialogUtils.showLoading(
              context: context,
              message: AppLocalizations.of(context)!.loading);
        } else if (state is LogInTabErrorState) {
          print(state.error.errorMessage);
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.error.errorMessage,
              title: AppLocalizations.of(context)!.error,
              posActionName: AppLocalizations.of(context)!.ok);
        } else if (state is LogInSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: AppLocalizations.of(context)!.loginSuccess,
              title: AppLocalizations.of(context)!.success,
              posAction: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
              posActionName: AppLocalizations.of(context)!.ok);
        }
      },
      builder: (context, state) => Form(
        key: viewModel.formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/APP_LOGO.png',
                    height: height * 0.35,
                  ),
                  CustomTextField(validator: AppValidators.validateEmail,
                    fillColor: AppColors.PrimaryDark,
                    hintText: AppLocalizations.of(context)!.email,
                    hintStyle: FontTheme.regular16White,
                    controller: viewModel.EmailController,
                    prefixIcon: ImageIcon(
                        color: AppColors.WhiteColor,
                        AssetImage('assets/images/email_icon.png')),
                  ),
                  SizedBox(height: height * 0.04),
                  CustomTextField(
                    validator: AppValidators.validatePassword,
                    obscure: viewModel.passwordObscureText,
                    fillColor: AppColors.PrimaryDark,
                    hintText: AppLocalizations.of(context)!.password,
                    hintStyle: FontTheme.regular16White,
                    controller: viewModel.password1Controller,
                    prefixIcon: ImageIcon(
                        color: AppColors.WhiteColor,
                        AssetImage('assets/images/lock_icon.png')),
                    suffixIcon: viewModel.passwordObscureText == false
                        ? InkWell(
                      onTap: () {
                        viewModel.ObscurePassword();
                      },
                      child: ImageIcon(
                          color: AppColors.WhiteColor,
                          AssetImage(
                              'assets/images/show_pass_icon.png')),
                    )
                        : InkWell(
                      onTap: () => viewModel.unObscurePassword(),
                      child: Icon(Icons.remove_red_eye_rounded,
                          color: AppColors.WhiteColor),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: FontTheme.regular16Primary,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomElevatedButton(
                      onTab: () => viewModel.LogIn(),
                      textStyle: FontTheme.regular20Black,
                      backgroundColor: AppColors.PrimaryColor,
                      text: AppLocalizations.of(context)!.login),
                  SizedBox(height: height * 0.02),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RegisterScreen.routeName),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: AppLocalizations.of(context)!.dontHaveAccount,
                            style: FontTheme.regular16White),
                        TextSpan(
                            text: AppLocalizations.of(context)!.createOne,
                            style: FontTheme.regular16Primary),
                      ]),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                width: 1.5, color: AppColors.PrimaryColor)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<ChangeLanguageProviders>(context,
                                      listen: false)
                                      .ChangeLanguage('en');
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                  Provider.of<ChangeLanguageProviders>(
                                      context)
                                      .LanguageApp ==
                                      'en'
                                      ? AppColors.PrimaryColor
                                      : AppColors.Transpernt,
                                  child: Image.asset('assets/images/en.png'),
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              InkWell(
                                onTap: () {
                                  Provider.of<ChangeLanguageProviders>(context,
                                      listen: false)
                                      .ChangeLanguage('ar');
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                  Provider.of<ChangeLanguageProviders>(
                                      context)
                                      .LanguageApp !=
                                      'en'
                                      ? AppColors.PrimaryColor
                                      : AppColors.Transpernt,
                                  radius: 20,
                                  child: Image.asset('assets/images/egy.png'),
                                ),
                              )
                            ]),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
