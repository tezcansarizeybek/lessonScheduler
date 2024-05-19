import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonscheduleandroid/modules/MainController.dart';
import 'package:lessonscheduleandroid/shared/constants/index.dart';
import 'package:lessonscheduleandroid/shared/extensions/index.dart';

class DaySelectWidget extends StatelessWidget {
  const DaySelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: 8.padAll,
        child: Container(
          padding: 8.padAll,
          decoration: BoxDecoration(
              color: AppColors.ULTRA_VIOLET,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Get.find<MainController>()
                .days
                .keys
                .map((key) => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.find<MainController>().selectedDay.value ==
                                  key
                              ? AppColors.LEAD
                              : AppColors.WHITE),
                      child: InkWell(
                        onTap: () {
                          Get.find<MainController>().selectedDay.value = key;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            key,
                            style: TextStyle(
                                color: Get.find<MainController>()
                                            .selectedDay
                                            .value ==
                                        key
                                    ? AppColors.WHITE
                                    : Get.isDarkMode
                                        ? AppColors.BLACK
                                        : AppColors.WHITE),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
