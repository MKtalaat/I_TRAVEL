import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_travel/config/local/cache_helper.dart';
import 'package:i_travel/core/utils/app_constants.dart';
import 'package:i_travel/core/utils/service_locator.dart';
import 'package:i_travel/firebase_options.dart';
import 'package:i_travel/i_travel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  await CacheHelper.init();
  AppConstants.userId = CacheHelper.getString(key: 'userId') ?? '';
  runApp(const ITravel());
}

