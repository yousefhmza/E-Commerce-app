import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  RegisterView({Key? key}) : super(key: key);

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
                  CustomText(
                    text: "تسجيل الدخول,",
                    fontSize: 28.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 50.0.h),
                  CustomTextFormField(
                    text: "الإسم",
                    hintText: "يوسف حمزه",
                    onSaved: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "برجاء إدخال قيمه صحيحه";
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "البريد الإلكتروني",
                    hintText: "iamdavid@gmail.com",
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        return "برجاء إدخال قيمه صحيحه";
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "كلمة المرور",
                    hintText: "**************",
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return "قم بإدخال كلمة مرور تزيد عن 8 أحرف";
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),

                  CustomButton(
                    text: "تسجيل الدخول",
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.signUp();
                      }
                    },
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
