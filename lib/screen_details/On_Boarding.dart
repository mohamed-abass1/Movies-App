import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';
import 'package:movies_app1/features/auth/login%20screen/login_screen.dart';
import 'package:movies_app1/reusable_widget/customElevatedButton.dart';

class IntroScreen extends StatefulWidget {
  static String route='intrio';
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  @override
  Widget build(BuildContext context) {
    int screen =0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Builder(
      builder: (context) {
        return IntroductionScreen(
          key: _introKey,
        isProgress: false,
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                  pageMargin: EdgeInsets.all(0),
                  titlePadding: EdgeInsets.all(0),
                  safeArea: 0,
                contentMargin: EdgeInsets.all(0)
              ),
        useScrollView: false,
              title: '',

                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.5,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/on boarding1.png',fit: BoxFit.cover,))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [SizedBox(height: height*0.6,),
                          Text('Find Your Next \n Favorite Movie Here',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                          SizedBox(height: height*0.02),
                          Text('Get access to a huge library of movies to suit all tastes. You will surely like it.',
                            style: FontTheme.regular20White,
                            textAlign: TextAlign.center,),
                          SizedBox(height: height*0.02),
                          CustomElevatedButton(
                              onTab: () {
                                Future.delayed(Duration.zero, () {
                                  _introKey.currentState?.next();
                                });
                              },

                              textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Explore Now')

                        ],
                      ),
                    ),

                  ],
                )
            ),
            PageViewModel(
                decoration: PageDecoration(

                    pageMargin: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.all(0),
                    safeArea: 0,
                    contentMargin: EdgeInsets.all(0)
                ),
                useScrollView: false,

                title: '',
                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.8,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/onboarding2.png',fit: BoxFit.cover,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [SizedBox(height: height*0.6,),

                        Container(height: height*0.35,
                          decoration: BoxDecoration(color: AppColors.BlackColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [  Text('Discover Movies',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                                SizedBox(height: height*0.02),
                                Text('Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease..',
                                  style: FontTheme.regular20White,
                                  textAlign: TextAlign.center,),    SizedBox(height: height*0.043),
                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.next();
                                  });
                                },

                                    textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Next')
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
            ),
            PageViewModel(
                decoration: PageDecoration(

                    pageMargin: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.all(0),
                    safeArea: 0,
                    contentMargin: EdgeInsets.all(0)
                ),
                useScrollView: false,

                title: '',
                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.8,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/ONBOARDING3.png',fit: BoxFit.cover,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [SizedBox(height: height*0.545,),

                        Container(height: height*0.42,
                          decoration: BoxDecoration(color: AppColors.BlackColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [  Text('Explore All Genres',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                                SizedBox(height: height*0.02),
                                Text('Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                                  style: FontTheme.regular20White,
                                  textAlign: TextAlign.center,),    SizedBox(height: height*0.043),
                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.next();
                                  });
                                },
                                    textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Next'),
                                SizedBox(height: height*0.02),

                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.previous();
                                  });
                                },

                                    borderColor: AppColors.PrimaryColor,
                                    textStyle: FontTheme.semi20Primary, backgroundColor: AppColors.Transpernt, text: 'Back')
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
            ),
            PageViewModel(
                decoration: PageDecoration(

                    pageMargin: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.all(0),
                    safeArea: 0,
                    contentMargin: EdgeInsets.all(0)
                ),
                useScrollView: false,

                title: '',
                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.8,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/onBoarding4.png',fit: BoxFit.cover,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [SizedBox(height: height*0.51,),

                        Container(height: height*0.45,
                          decoration: BoxDecoration(color: AppColors.BlackColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [  Text('Create Watchlists',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                                SizedBox(height: height*0.02),
                                Text('Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
                                  style: FontTheme.regular20White,
                                  textAlign: TextAlign.center,),    SizedBox(height: height*0.043),
                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.next();
                                  });
                                },

                                    textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Next'),
                                SizedBox(height: height*0.02),

                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.previous();
                                  });
                                },

                                    borderColor: AppColors.PrimaryColor,
                                    textStyle: FontTheme.semi20Primary, backgroundColor: AppColors.Transpernt, text: 'Back')
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
            ),
            PageViewModel(
                decoration: PageDecoration(

                    pageMargin: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.all(0),
                    safeArea: 0,
                    contentMargin: EdgeInsets.all(0)
                ),
                useScrollView: false,

                title: '',
                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.8,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/onBoarding5.png',fit: BoxFit.cover,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [SizedBox(height: height*0.45,),

                        Container(height: height*0.5,
                          decoration: BoxDecoration(color: AppColors.BlackColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [  Text('Rate, Review, and Learn',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                                SizedBox(height: height*0.02),
                                Text("Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
                                  style: FontTheme.regular20White,
                                  textAlign: TextAlign.center,),    SizedBox(height: height*0.043),
                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.next();
                                  });
                                },

                                    textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Next'),
                                SizedBox(height: height*0.02),

                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.previous();
                                  });
                                },
                                    borderColor: AppColors.PrimaryColor,
                                    textStyle: FontTheme.semi20Primary, backgroundColor: AppColors.Transpernt, text: 'Back')
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
            ),
            PageViewModel(
                decoration: PageDecoration(

                    pageMargin: EdgeInsets.all(0),
                    titlePadding: EdgeInsets.all(0),
                    safeArea: 0,
                    contentMargin: EdgeInsets.all(0)
                ),
                useScrollView: false,

                title: '',
                bodyWidget: Stack(
                  children: [Opacity(
                      opacity: 0.8,
                      child:
                      SizedBox(height: height*0.95,width: width*1,
                          child: Image.asset('assets/images/onBoarding6.png',fit: BoxFit.cover,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [SizedBox(height: height*0.65,),

                        Container(height: height*0.3,
                          decoration: BoxDecoration(color: AppColors.BlackColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [  Text('Start Watching Now',style: FontTheme.bold36White,textAlign: TextAlign.center,),
                                SizedBox(height: height*0.02),
                                SizedBox(height: height*0.043),
                                CustomElevatedButton(onTab: () { Navigator.pop(context);
                                  Navigator.pushNamed(context, LoginScreen.initialRoute);},
                                    textStyle: FontTheme.semi20Black, backgroundColor: AppColors.PrimaryColor, text: 'Finish '),
                                SizedBox(height: height*0.02),

                                CustomElevatedButton(onTab: () {
                                  Future.delayed(Duration.zero, () {
                                    _introKey.currentState?.previous();
                                  });
                                },
                                    borderColor: AppColors.PrimaryColor,
                                    textStyle: FontTheme.semi20Primary, backgroundColor: AppColors.Transpernt, text: 'Back')
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
            ),


          ],
          showDoneButton: false,
          showNextButton: false,
        );
      }
    );
  }
}