import 'package:ecommerce/view/auth/register_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_button_social.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/constants.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.0.h,
            right: 20.0.w,
            left: 20.0.w,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Welcome,",
                        fontSize: 28.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterView());
                        },
                        child: CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontSize: 16.0.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0.h),
                  CustomText(
                    text: "Sign In To Continue",
                    color: Colors.grey,
                    fontSize: 12.0.sp,
                  ),
                  SizedBox(height: 50.0.h),
                  CustomTextFormField(
                    text: "Email",
                    hintText: "iamdavid@gmail.com",
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        return "Please enter a valid value";
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "Password",
                    hintText: "**************",
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return "Please enter a valid password with characters more than 8";
                      }
                    },
                  ),
                  SizedBox(height: 20.0.h),
                  CustomText(
                    text: "Forget Password ?",
                    fontSize: 12.0.sp,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  SizedBox(height: 20.0.h),
                  CustomButton(
                    text: "SIGN IN",
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signIn();
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomText(
                    text: "-OR-",
                    fontSize: 16.0.sp,
                    alignment: AlignmentDirectional.center,
                  ),
                  SizedBox(height: 30.0.h),
                  CustomButtonSocial(
                    onPressed: () {
                      controller.facebookSignIn();
                    },
                    text: "Sign In With Facebook",
                    imageName: "facebook icon.png",
                  ),
                  SizedBox(height: 20.0.h),
                  CustomButtonSocial(
                    onPressed: () {
                      controller.googleSignIn();
                    },
                    text: "Sign In With Google",
                    imageName: "google icon.png",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
