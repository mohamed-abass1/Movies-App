import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app1/di/di.dart';
import 'package:movies_app1/features/auth/Reset%20Password/Reset_Password.dart';
import 'package:movies_app1/features/home_screen/home_screen.dart';
import 'package:movies_app1/features/screens/update_profile/UpdateStates.dart';
import 'package:movies_app1/features/screens/update_profile/UpdateViewModel.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';
import 'package:movies_app1/reusable_widget/customTextField.dart';
import 'package:provider/provider.dart';

import '../../../core/DialogeUtils.dart';
import '../../../core/providers/changeAvatarsProviders.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/font_theme.dart';
import '../../../screen_details/AvatarsBottomSheet.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = 'Update_profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late UpdateViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<UpdateViewModel>();

  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final avatarProvider =
      Provider.of<ChangeAvatarProviders>(context, listen: false);
      if (avatarProvider.oldAvatar != null) {
        viewModel.avatar = viewModel.avatars[avatarProvider.oldAvatar];
      }
    });

    final avatarProvider = Provider.of<ChangeAvatarProviders>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocListener<UpdateViewModel, UpdateStates>(
      bloc: viewModel,
      listener: (BuildContext context, state) {
        if (state is UpdateDownloadState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is UpdateErrorState) {
          print(state.error.errorMessage);
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.error.errorMessage,
              title: 'Error',
              posActionName: 'OK');
        } else if (state is UpdateSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Updated Successfully',
              title: 'Success',
              posAction:(){Navigator.pushNamed(context, HomeScreen.routeName);},
              posActionName: 'OK');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.BlackColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.BlackColor,
          title: Text('Pick Avatar', style: FontTheme.regular16Primary),
          iconTheme: IconThemeData(color: AppColors.PrimaryColor),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.Transpernt,
                      context: context,
                      builder: (context) => AvatarsBottomSheet(),
                    );
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.17,
                    decoration: BoxDecoration(
                      color: AppColors.Transpernt,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      avatarProvider.oldAvatar ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              CustomTextField(
                cursorColor: AppColors.WhiteColor,
                prefixIcon: ImageIcon(
                    color: AppColors.WhiteColor,
                    AssetImage('assets/images/email_icon.png')),
                fillColor: AppColors.PrimaryDark,
                hintText: 'Email',
                hintStyle: FontTheme.regular14White,
              ),
              SizedBox(height: height * 0.04),
              SizedBox(height: height * 0.04),
              InkWell(onTap: () => Navigator.pushNamed(context,ResetPassword.initialRoute),
                  child: Text('Reset Password', style: FontTheme.regular20White)),
              Spacer(),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  viewModel.UpdateProfile();
                },
                child: CustomElevatedButton(
                  textStyle: FontTheme.regular20Black,
                  backgroundColor: AppColors.PrimaryColor,
                  text: 'Update Data',
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
