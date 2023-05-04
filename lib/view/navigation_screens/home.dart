import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:monkeybox_final/Cubit/theme_cubit.dart';
import 'package:monkeybox_final/utilities/app_colors.dart';
import 'package:monkeybox_final/utilities/app_assets.dart';
import 'package:sizer/sizer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 2.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monkeypox Disease',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: clr.primaryColor),
                    ),
                    FlutterSwitch(
                      value: context.watch<ThemeCubit>().state.isDark,
                      onToggle: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                      activeIcon: Icon(
                        Icons.lightbulb,
                        color: Colors.black,
                      ),
                      inactiveIcon: Icon(
                        Icons.lightbulb_outline,
                        color: Colors.black,
                      ),
                      activeColor: clr.primaryColor,
                      inactiveColor: Colors.grey,
                      height: 4.h,
                      width: 15.w,
                      // toggleSize: 40.0,
                      // borderRadius: 500,
                      padding: 3.0,
                    ),
                    // Switch(
                    //   activeColor: clr.primaryColor,
                    //   value: context.watch<ThemeCubit>().state.isDark,
                    //   onChanged: (value) {
                    //     context.read<ThemeCubit>().toggleTheme();
                    //   },
                    // ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Image.asset(
                  appImages.homeImage,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                    'Monkeypox is a rare'
                    ' disease caused by infection'
                    ' with the Monkeypox virus. Monkeypox virus'
                    ' is part of the same family of viruses as variola virus, the virus that causes'
                    ' smallpox. Monkeypox symptoms are similar to smallpox symptoms, but milder, '
                    'and Monkeypox is rarely fatal. Monkeypox is not related to chickenpox.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  thickness: 2,
                ),
                Text(
                  'Symptoms',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: clr.primaryColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(appImages.FevwrImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Fever',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Image.asset(appImages.ExhaustionImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Exhaustion',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Image.asset(appImages.rashImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'rash',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Image.asset(appImages.HeadacheImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Headache',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Preventions',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: clr.primaryColor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(appImages.washHandsImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Wash Hands',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Image.asset(appImages.vaccinesImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Get Vaccinated',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        children: [
                          Image.asset(appImages.noTouchImage),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Avoid using\n infected objects',
                            style: TextStyle(
                                color: clr.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      //     floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //   context.read<ThemeCubit>().toggleTheme();
      // },
      // child: Icon(Icons.color_lens),
      // ),
      // bottomNavigationBar: BottomAppBar(
      // child: Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      // height: 56,
      // child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
      // Text('Dark Mode'),
      // //
      // ],
      // ),
      // ),
      // ),
    );
  }
}

// enum ThemeMode { light, dark }
//
// class ThemeCubit extends Cubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.light);
//
//   static ThemeCubit get(context) => BlocProvider.of(context);
//
//   void toggleTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (state == ThemeMode.light) {
//       prefs.setBool('isDark', true);
//       emit(ThemeMode.dark);
//     } else {
//       prefs.setBool('isDark', false);
//       emit(ThemeMode.light);
//     }
//   }
//
//   void initTheme() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isDark = prefs.getBool('isDark') ?? false;
//     if (isDark) {
//       emit(ThemeMode.dark);
//     } else {
//       emit(ThemeMode.light);
//     }
//   }
//
//   ThemeData get currentTheme {
//     switch (state) {
//       case ThemeMode.light:
//         return ThemeData.light();
//       case ThemeMode.dark:
//         return ThemeData.dark();
//       default:
//         return ThemeData.light();
//     }
//   }
// }
//
