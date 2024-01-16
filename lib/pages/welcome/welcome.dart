import 'package:andalanqu/common/values/colors.dart';
import 'package:andalanqu/main.dart';
import 'package:andalanqu/pages/welcome/bloc/welcome_blocs.dart';
import 'package:andalanqu/pages/welcome/bloc/welcome_events.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Belanja, Andalanqu aja!",
                        "Belanja apapun, kapanpun dan dimanapun cukup dengan satu kali klik.",
                        "next",
                        "assets/images/reading.png"),
                    _page(
                        2,
                        context,
                        "Belanja, Andalanqu aja!",
                        "Belanja apapun, kapanpun dan dimanapun cukup dengan satu kali klik.",
                        "next",
                        "assets/images/boy.png"),
                    _page(
                        3,
                        context,
                        "Yuk, Mulai Belanja!",
                        "Belanja apapun, kapanpun dan dimanapun cukup dengan satu kali klik.",
                        "get started",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 90.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String title, String subtitle,
      String buttonName, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2
            if (index < 3) {
              //  animation
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //  jump to new page
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
