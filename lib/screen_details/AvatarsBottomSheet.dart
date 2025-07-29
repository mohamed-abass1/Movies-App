import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/changeAvatarsProviders.dart';
import '../core/utils/app_colors.dart';


class AvatarsBottomSheet extends StatefulWidget {
  State<AvatarsBottomSheet> createState() => _AvatarsBottomSheetState();
}
class _AvatarsBottomSheetState extends State<AvatarsBottomSheet> {
  String selectedImage = 'assets/images/avatar1.png';
  Widget build(BuildContext context) {
    var avatarProvider = Provider.of<ChangeAvatarProviders>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(padding: EdgeInsets.only(left:width*0.03, top:height*0.04 ),
        margin: EdgeInsets.only(right: width*0.01,left: width*0.01,bottom: height*0.02),
        decoration: BoxDecoration(color: AppColors.PrimaryDark
        ,borderRadius: BorderRadius.circular(24) ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar1.png';
                      });
                      avatarProvider.ChangeAvatar('assets/images/avatar1.png');
                    },
                    child: showAvatars(
                      imagePath: 'assets/images/avatar1.png',
                      height: height,
                      selectedImage: selectedImage,
                      index: 1,
                    )),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar2.png';
                      });
                      avatarProvider.ChangeAvatar('assets/images/avatar2.png');

                    },
                    child: showAvatars(
                      imagePath: 'assets/images/avatar2.png',
                      height: height,
                      selectedImage: selectedImage,
                      index: 2,
                    )),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar3.png';
                      });
                      avatarProvider.ChangeAvatar('assets/images/avatar3.png');

                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar3.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 3)),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar4.png';
                      });
                      avatarProvider.ChangeAvatar('assets/images/avatar4.png');

                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar4.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 4)),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar5.png';
                        avatarProvider.ChangeAvatar('assets/images/avatar5.png');

                      });
                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar5.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 5)),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar6.png';
                        avatarProvider.ChangeAvatar('assets/images/avatar6.png');

                      });
                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar6.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 6))
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar7.png';
                        avatarProvider.ChangeAvatar('assets/images/avatar7.png');

                      });
                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar7.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 7)),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar8.png';
                        avatarProvider.ChangeAvatar('assets/images/avatar8.png');

                      });
                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar8.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 8)),
                SizedBox(
                  width: width * 0.01,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedImage = 'assets/images/avatar9.png';
                        avatarProvider.ChangeAvatar('assets/images/avatar9.png');

                      });
                    },
                    child: showAvatars(
                        imagePath: 'assets/images/avatar9.png',
                        height: height,
                        selectedImage: selectedImage,
                        index: 9)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showAvatars(
      {required String imagePath,
      var height,
      required String? selectedImage,
      required int index}) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.PrimaryColor, width: 1.5),
          color: imagePath == selectedImage
              ? AppColors.TransperntPrimaryColor
              : AppColors.Transpernt),
      child: Image.asset(
        imagePath,
        height: height * 0.12,
      ),
    );
  }
}
