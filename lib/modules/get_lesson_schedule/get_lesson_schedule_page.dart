import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';
import 'package:lessonscheduleandroid/shared/widgets/AppBar/CustomAppBar.dart';

class GetLessonSchedulePage extends StatelessWidget {
  const GetLessonSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppStrings.SUGGESTEDLESSONSCHEDULE,
            style: TextStyle(fontSize: 20.spMin, color: AppColors.WHITE)),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var element =
              Get.find<MainController>().lessonPlan.value.plan.elementAt(index);
          return ListTile(
            tileColor:
                index % 2 == 0 ? AppColors.LOBSTER : AppColors.ULTRA_VIOLET,
            title: Text(
              element.gun,
              style: TextStyle(fontSize: 16.spMin, color: AppColors.WHITE),
            ),
            subtitle: Text(
              element.saat,
              style: TextStyle(fontSize: 16.spMin, color: AppColors.WHITE),
            ),
            trailing: Text(
              element.ders,
              style: TextStyle(fontSize: 16.spMin, color: AppColors.WHITE),
            ),
          );
        },
        itemCount: Get.find<MainController>().lessonPlan.value.plan.length,
      ),
    );
  }
}
