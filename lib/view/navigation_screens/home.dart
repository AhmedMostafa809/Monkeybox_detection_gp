import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monkeybox_final/utilities/app_colors.dart';
import 'package:monkeybox_final/utilities/app_assets.dart';
import 'package:sizer/sizer.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 2.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    'Monkeypox Disease',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: clr.primaryColor),
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
            )));
  }
}
