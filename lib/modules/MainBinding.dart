// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
  }
}
