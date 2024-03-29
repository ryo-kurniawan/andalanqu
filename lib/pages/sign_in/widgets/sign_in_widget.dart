import 'package:andalanqu/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    centerTitle: true,
    title: Text(
      "Log In",
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook"),
        ],
      )
    );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: (){

    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 4.h),
    child: Text(
        text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.7),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName){
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: Colors.black54)
    ),
    child: Row(

      children: [
        Container(
            width: 20.w,height: 20.h,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset("assets/icons/$iconName.png", color: Colors.black54,)
        ),

        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText
              )

            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false,
        ),
        ),
      ],
    ),
  );
}

Widget forgotPassword(){
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: (){

      },
      child: Text(
          "Forgot password?",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          fontSize: 12.sp
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName, String buttonType ){
  return GestureDetector(
    onTap: (){

    },
    child: Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType=="login"?40.h:20.h),
      width: 325.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: buttonType=="login"?AppColors.primaryElement:AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
          color: buttonType=="login"?Colors.transparent:AppColors.primaryElement
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(0.1)
          )
        ]
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonType=="login"?AppColors.primaryBackground:AppColors.primaryElement,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal
          ),
        ),
      ),
    ),
  );
}