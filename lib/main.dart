import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/view/themes.dart';
import 'package:ecommerce/core/services/databases/cart_database_helper.dart';
import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/helper/binding.dart';
import 'package:ecommerce/view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  CartDatabaseHelper.instance.database;
  Get.put(CartViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393.0, 760.0),
      builder: () => GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: const ControlView(),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
