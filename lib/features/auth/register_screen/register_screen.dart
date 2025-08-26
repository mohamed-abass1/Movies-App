import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/DialogeUtils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../core/validator.dart';
import '../../../di/di.dart';
import '../../../reusable_widget/customElevatedButton.dart';
import '../../../reusable_widget/customTextField.dart';
import '../login screen/login_screen.dart';
import 'RegisterStates.dart';
import 'RegisterViewModel.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'register';
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<RegisterViewModel, RegisterTabStates>(
      bloc: viewModel,
      listener: (BuildContext context, RegisterTabStates state) {
        if (state is RegisterDownloadState) {
          DialogUtils.showLoading(
            context: context,
            message: AppLocalizations.of(context)!.loading,
          );
        } else if (state is RegisterTabErrorState) {
          print(state.error.errorMessage);
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.error.errorMessage,
            title: AppLocalizations.of(context)!.error,
            posActionName: AppLocalizations.of(context)!.ok,
          );
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: AppLocalizations.of(context)!.registerSuccess,
            title: AppLocalizations.of(context)!.success,
            posActionName: AppLocalizations.of(context)!.ok,
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.register,
            style: TextStyle(color: AppColors.PrimaryColor),
          ),
          backgroundColor: AppColors.PrimaryDark,
          iconTheme: IconThemeData(color: AppColors.PrimaryColor),
        ),
        body: Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              Container(
                height: height * 0.15,
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.33,
                    enlargeFactor: 0.6,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) => viewModel.avatar = index,
                    initialPage: 0,
                    height: 300.0,
                  ),
                  items: viewModel.avatars.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: InkWell(
                            child: Image.asset(i, fit: BoxFit.contain),
                            onTap: () {
                              viewModel.selectedAvatar = i;
                              print(viewModel.selectedAvatar);
                            },
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.avatars,
                  style: TextStyle(color: AppColors.WhiteColor),
                ),
              ),
              CustomTextField(
                controller: viewModel.NameController,
                validator: AppValidators.validateUsername,
                fillColor: AppColors.PrimaryDark,
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/Name Icon.png'),
                  color: AppColors.WhiteColor,
                ),
                hintText: AppLocalizations.of(context)!.name,
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(validator: AppValidators.validateEmail,
                fillColor: AppColors.PrimaryDark,
                controller: viewModel.EmailController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/email_icon.png'),
                  color: AppColors.WhiteColor,
                ),
                hintText: AppLocalizations.of(context)!.email,
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                fillColor: AppColors.PrimaryDark,
                controller: viewModel.password1Controller,
                validator: AppValidators.validatePassword,
                obscure: viewModel.passwordObscureText,
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/lock_icon.png'),
                  color: AppColors.WhiteColor,
                ),
                hintText: AppLocalizations.of(context)!.password,
                suffixIcon: viewModel.passwordObscureText
                    ? InkWell(
                  onTap: () {
                    viewModel.unObscurePassword();
                  },
                  child: ImageIcon(
                    color: AppColors.WhiteColor,
                    AssetImage('assets/images/show_pass_icon.png'),
                  ),
                )
                    : InkWell(
                  onTap: () => viewModel.ObscurePassword(),
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    color: AppColors.WhiteColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                fillColor: AppColors.PrimaryDark,
                obscure: viewModel.RepasswordObscureText,
                controller: viewModel.rePassword1Controller,
                validator: AppValidators.validatePassword,
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/lock_icon.png'),
                  color: AppColors.WhiteColor,
                ),
                hintText: AppLocalizations.of(context)!.confirmPassword,
                suffixIcon: viewModel.RepasswordObscureText
                    ? InkWell(
                  onTap: () {
                    viewModel.unObscureRePassword();
                  },
                  child: ImageIcon(
                    color: AppColors.WhiteColor,
                    AssetImage('assets/images/show_pass_icon.png'),
                  ),
                )
                    : InkWell(
                  onTap: () => viewModel.ObscureRePassword(),
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    color: AppColors.WhiteColor,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomTextField(
                fillColor: AppColors.PrimaryDark,
                controller: viewModel.phoneNumController,
                prefixIcon: ImageIcon(
                  AssetImage('assets/images/phone_logo.png'),
                  color: AppColors.WhiteColor,
                ),
                hintText: AppLocalizations.of(context)!.phoneNumber,
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                onTab: () => viewModel.register(),
                textStyle: FontTheme.regular20Black,
                backgroundColor: AppColors.PrimaryColor,
                text: AppLocalizations.of(context)!.createAccount,
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, LoginScreen.initialRoute),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                        AppLocalizations.of(context)!.alreadyHaveAccount + " ",
                        style: FontTheme.regular16White,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.login,
                        style: FontTheme.regular16Primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
