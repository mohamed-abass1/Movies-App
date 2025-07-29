import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/features/home_screen/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app1/features/home_screen/tabs/home_tab/home_tab.dart';
import 'package:movies_app1/features/home_screen/tabs/profile_tab/profile_Tab.dart';
import 'package:movies_app1/features/home_screen/tabs/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIcon = 0;

  List<Widget> selectedWidget = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          selectedWidget[selectedIcon],
          BottomAppBar(
            height: height * 0.12,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical:25 ),
            color: AppColors.Transpernt,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.PrimaryDark,

                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      child: ImageIcon(
                        const AssetImage(
                            'assets/images/unSelected_home_icon.png'),
                        color: selectedIcon == 0
                            ? AppColors.PrimaryColor
                            : AppColors.WhiteColor,
                      ),
                      onTap: () {
                        selectedIcon = 0;
                        setState(() {});
                      }),
                  InkWell(
                      child: ImageIcon(
                          const AssetImage(
                              'assets/images/search_unselected_icon.png'),
                          color: selectedIcon == 1
                              ? AppColors.PrimaryColor
                              : AppColors.WhiteColor),
                      onTap: () {
                        selectedIcon = 1;
                        setState(() {});
                      }),
                  InkWell(
                    child: ImageIcon(
                        const AssetImage(
                            'assets/images/unSelected_browse_icon.png'),
                        color: selectedIcon == 2
                            ? AppColors.PrimaryColor
                            : AppColors.WhiteColor),
                    onTap: () {
                      selectedIcon = 2;
                      setState(() {});
                    },
                  ),
                  InkWell(
                      child: ImageIcon(
                          const AssetImage(
                              'assets/images/unSelected_profile_icon.png'),
                          color: selectedIcon == 3
                              ? AppColors.PrimaryColor
                              : AppColors.WhiteColor),
                      onTap: () {
                        selectedIcon = 3;
                        setState(() {});
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
